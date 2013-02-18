#!/bin/sh

# DESCRIPTION
# Defines functions for installing and configuring software.

# Cleans work path for temporary processing of installs.
function clean_work_path {
  rm -rf "$WORK_PATH"
}
export -f clean_work_path

# Verifies the install exists and completed successfully.
# Parameters:
# $1 = The application name.
function verify_install {
  application="/Applications/$1.app"
  if [ ! -e "$application" ]; then
    echo "ERROR: $application not found. Existing."
    exit 1
  fi
}
export -f verify_install

# Checks for missing installs.
function check_installs {
  echo "\nChecking installs..."

  # Acquire environment variables that only end with "APP_NAME".
  app_names=`set | awk -F "=" '{print $1}' | grep ".*APP_NAME"`

  # For each application name in app_names, check to see if the application is installed. Otherwise, skip.
  for name in $app_names
  do
    app_path="$(eval echo \$$name)"
    if [ ! -e "/Applications/$app_path.app" ]; then
      echo " - Missing: $app_path"
    fi
  done

  echo "Install check complete."
}
export -f check_installs

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

# Installs an application.
# Parameters:
# $1 = The application path.
# $2 = The application name.
function install_app {
  echo "Installing /Applications/$2.app..."
  cp -a "$1/$2.app" "/Applications"
}
export -f install_app

# Installs a package.
# Parameters:
# $1 = The package path.
# $2 = The application name.
function install_pkg {
  echo "Installing /Applications/$2.app..."
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
  app_name="$4.app"
  app_path="/Applications/$app_name"

  if [ -e "$app_path" ]; then
    echo "Installed: $app_name."
  else
    download_installer $1 $2
    download_file="$WORK_PATH/$2"

    echo "Mounting..."
    hdiutil attach "$download_file" -noidmereveal
    mount_point="/Volumes/$3"

    install_app "$mount_point" "$4"

    echo "Cleaning..."
    hdiutil detach -force "$mount_point"
    rm -f $download_file

    verify_install "$4"
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
  app_name="$4.app"
  app_path="/Applications/$app_name"

  if [ -e "$app_path" ]; then
    echo "Installed: $app_name."
  else
    download_installer "$1" "$2"
    download_file="$WORK_PATH/$2"

    echo "Mounting..."
    hdiutil attach "$download_file" -noidmereveal
    mount_point="/Volumes/$3"

    install_pkg "$mount_point" "$4"

    echo "Cleaning..."
    hdiutil detach -force "$mount_point"
    rm -f $download_file

    verify_install "$4"
  fi
}
export -f install_dmg_pkg

# Installs an application via a zip file.
# Parameters:
# $1 = The remote URL.
# $2 = The download file name.
# $3 = The application name.
function install_zip_app {
  app_name="$3.app"
  app_path="/Applications/$app_name"

  if [ -e "$app_path" ]; then
    echo "Installed: $app_name."
  else
    download_installer "$1" "$2"

    echo "Preparing..."
    cd "$WORK_PATH"
    unzip -q "$2"

    install_app "$WORK_PATH" "$3"
    verify_install "$3"
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
  app_name="$4.app"
  app_path="/Applications/$app_name"

  if [ -e "$app_path" ]; then
    echo "Installed: $app_name."
  else
    download_installer "$1" "$2"

    echo "Preparing..."
    cd "$WORK_PATH"
    tar "$3" "$2"

    install_app "$WORK_PATH" "$4"
    verify_install "$4"
  fi
}
export -f install_tar_app

# Installs a package via a zip file.
# Parameters:
# $1 = The remote URL.
# $2 = The download file name.
# $3 = The application name.
function install_zip_pkg {
  app_name="$3.app"
  app_path="/Applications/$app_name"

  if [ -e "$app_path" ]; then
    echo "Installed: $app_name."
  else
    download_installer "$1" "$2"

    echo "Preparing..."
    cd "$WORK_PATH"
    unzip -q "$2"

    install_pkg "$WORK_PATH" "$3"
    verify_install "$3"
  fi
}
export -f install_zip_pkg
