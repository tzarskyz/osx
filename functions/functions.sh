#!/bin/sh

# DESCRIPTION
# Defines functions for installing and configuring software.

# Answers the extension of a file.
# Parameters:
# $1 = The file name.
function get_file_extension {
  echo "${1##*.}" # Answer the suffix (without the dot).
}
export -f get_file_extension

# Answers the root install path for file name.
# Parameters:
# $1 = The file name.
function get_install_root {
  file_name="$1" # Make the parameter easier to read.
  file_extension=$(get_file_extension "$file_name")

  # Dynamically build the install path based on file extension type.
  case $file_extension in
    'app')
      install_path="/Applications";;
    'prefPane')
      install_path="/Library/PreferencePanes";;
  esac

  # Return the install path.
  echo "$install_path"
}
export -f get_install_root

# Answers the full install path (including file name) for file name.
# Parameters:
# $1 = The file name.
function get_install_path {
  file_name="$1" # Make the parameter easier to read.
  install_path=$(get_install_root "$file_name")
  echo "$install_path/$file_name"
}
export -f get_install_path

# Verifies the install exists.
# Parameters:
# $1 = The file name.
function verify_install {
  file_name="$1" # Make the parameter easier to read.

  # Display the missing install if not found.
  install_path=$(get_install_path "$file_name")
  if [ ! -e "$install_path" ]; then
    echo " - Missing: $file_name"
  fi
}
export -f verify_install

# Checks for missing installs.
function verify_installs {
  echo "\nChecking installs..."

  # Only use environment variables that end with "APP_NAME".
  file_names=`set | awk -F "=" '{print $1}' | grep ".*APP_NAME"`

  # For each application name, check to see if the application is installed. Otherwise, skip.
  for name in $file_names
  do
    # Evaluate/extract the key (name) value and pass it on for verfication.
    verify_install "$(eval echo \$$name)"
  done

  echo "Install check complete."
}
export -f verify_installs

# Cleans work path for temporary processing of installs.
function clean_work_path {
  echo "Cleaning: $WORK_PATH..."
  rm -rf "$WORK_PATH"
}
export -f clean_work_path

# Downloads an installer to local disk.
# Parameters:
# $1 = The remote URL.
# $2 = The file name.
function download_installer {
	echo "Downloading $1/$2..."
	clean_work_path
	mkdir $WORK_PATH
	cd $WORK_PATH
	curl -LO "$1/$2"
	cd ..
}
export -f download_installer

# Downloads an installer to the $HOME/Downloads folder for manual use.
# Parameters:
# $1 = The remote URL.
# $2 = The file name.
function download_only {
  if [ -e "$HOME/Downloads/$2" ]; then
    echo "Downloaded: $2."
  else
    echo "Downloading $1/$2..."
    clean_work_path
    mkdir $WORK_PATH
    cd $WORK_PATH
    curl -LO "$1/$2"
    mv "$WORK_PATH/$2" "$HOME/Downloads"
  fi
}
export -f download_only

# Mounts a disk image.
# Parameters:
# $1 = The image path.
function mount_image {
  echo "Mounting image..."
  hdiutil attach "$1" -noidmereveal
}
export -f mount_image

# Unmounts a disk image.
# Parameters:
# $1 = The mount path.
function unmount_image {
  echo "Unmounting image..."
  hdiutil detach -force "$1"
}
export -f unmount_image

# Installs an application.
# Parameters:
# $1 = The application source path.
# $2 = The application name.
function install_app {
  install_root=$(get_install_root "$2")

  echo "Installing $2 in $install_root..."
  file_extension=$(get_file_extension "$2")
  if [ "$file_extension" == "prefPane" ]; then
    sudo cp -pR "$1/$2" "$install_root"
  else
    cp -a "$1/$2" "$install_root"
  fi
}
export -f install_app

# Installs a package.
# Parameters:
# $1 = The package source path.
# $2 = The application name.
function install_pkg {
  install_root=$(get_install_root "$2")

  echo "Installing $2 in $install_root..."
  package=$(sudo find "$1" -type f -name "*.pkg" -o -name "*.mpkg")
  sudo installer -pkg "$package" -target /
}
export -f install_pkg

# Installs an application via a DMG file.
# Parameters:
# $1 = The remote URL.
# $2 = The download file name.
# $3 = The mount path.
# $4 = The application name.
function install_dmg_app {
  app_name="$4"
  install_path=$(get_install_path "$app_name")

  if [ -e "$install_path" ]; then
    echo "Installed: $app_name."
  else
    download_installer $1 $2
    download_file="$WORK_PATH/$2"

    mount_point="/Volumes/$3"
    mount_image "$download_file"
    install_app "$mount_point" "$app_name"
    unmount_image "$mount_point"

    verify_install "$app_name"
  fi
}
export -f install_dmg_app

# Installs a package via a DMG file.
# Parameters:
# $1 = The remote URL.
# $2 = The download file name.
# $3 = The mount path.
# $4 = The application name.
function install_dmg_pkg {
  app_name="$4"
  install_path=$(get_install_path "$app_name")

  if [ -e "$install_path" ]; then
    echo "Installed: $app_name."
  else
    download_installer "$1" "$2"
    download_file="$WORK_PATH/$2"

    mount_point="/Volumes/$3"
    mount_image "$download_file"
    install_pkg "$mount_point" "$app_name"
    unmount_image "$mount_point"

    verify_install "$app_name"
  fi
}
export -f install_dmg_pkg

# Installs an application via a zip file.
# Parameters:
# $1 = The remote URL.
# $2 = The download file name.
# $3 = The application name.
function install_zip_app {
  app_name="$3"
  install_path=$(get_install_path "$app_name")

  if [ -e "$install_path" ]; then
    echo "Installed: $app_name."
  else
    download_installer "$1" "$2"

    echo "Preparing..."
    cd "$WORK_PATH"
    unzip -q "$2"

    install_app "$WORK_PATH" "$app_name"
    verify_install "$app_name"
  fi
}
export -f install_zip_app

# Installs an application via a tar file.
# Parameters:
# $1 = The remote URL.
# $2 = The download file name.
# $3 = The uncompress options.
# $4 = The application name.
function install_tar_app {
  app_name="$4"
  install_path=$(get_install_path "$app_name")

  if [ -e "$install_path" ]; then
    echo "Installed: $app_name."
  else
    download_installer "$1" "$2"

    echo "Preparing..."
    cd "$WORK_PATH"
    tar "$3" "$2"

    install_app "$WORK_PATH" "$app_name"
    verify_install "$app_name"
  fi
}
export -f install_tar_app

# Installs a package via a zip file.
# Parameters:
# $1 = The remote URL.
# $2 = The download file name.
# $3 = The application name.
function install_zip_pkg {
  app_name="$3"
  install_path=$(get_install_path "$app_name")

  if [ -e "$install_path" ]; then
    echo "Installed: $app_name."
  else
    download_installer "$1" "$2"

    echo "Preparing..."
    cd "$WORK_PATH"
    unzip -q "$2"

    install_pkg "$WORK_PATH" "$app_name"
    verify_install "$app_name"
  fi
}
export -f install_zip_pkg
