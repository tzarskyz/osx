#!/bin/sh

# DESCRIPTION
# Installs and configures OSX software.

# Downloads an installer to local disk.
# Parameters:
# $1 = url
# $2 = file name
function download_installer {
	echo "Downloading $1/$2..."
	rm -rf $WORK_PATH
	mkdir $WORK_PATH
	cd $WORK_PATH
	curl -LO "$1/$2"
	cd ..
}
export -f download_installer

# Downloads an installer to the $HOME/Downloads folder for manual use.
# Parameters:
# $1 = url
# $2 = file name
function download_only {
	echo "Downloading $1/$2..."
	rm -rf $WORK_PATH
	mkdir $WORK_PATH
	cd $WORK_PATH
	curl -LO "$1/$2"
	mv $WORK_PATH/$2 $HOME/Downloads
}
export -f download_only

# Installs an application.
# Parameters:
# $1 = application path
function install_app {
	echo "Installing..."
	find "$1" -type d -name "*.app" -exec sh -c 'cp -a "$0" /Applications/' {} ';'
}
export -f install_app

# Installs a package.
# Parameters:
# $1 = package path
function install_pkg {
	echo "Installing..."
	find "$1" -type f -name "*.pkg" -o -name "*.mpkg" -exec sh -c 'sudo installer -pkg "$0" -target /' {} ';'
}
export -f install_pkg

# Installs a package via a DMG file.
# Parameters:
# $1 = URL
# $2 = download file name
# $3 = mount path
function install_dmg_pkg {
	mount_point="/Volumes/$3"

	download_installer $1 $2
	download_file="$WORK_PATH/$2"

	echo "Mounting..."
	hdiutil attach "$download_file"

	install_pkg "$mount_point"

	echo "Cleaning..."
	hdiutil detach -force "$mount_point"
	rm -f $download_file
}
export -f install_dmg_pkg

# Installs an application via a DMG file.
# Parameters:
# $1 = URL
# $2 = download file name
# $3 = mount path
function install_dmg_app {
	mount_point="/Volumes/$3"

	download_installer $1 $2
	download_file="$WORK_PATH/$2"

	echo "Mounting..."
	hdiutil attach "$download_file"

	install_app "$mount_point"

	echo "Cleaning..."
	hdiutil detach -force "$mount_point"
	rm -f $download_file
}
export -f install_dmg_app

# Installs an application via a zip file.
# Parameters:
# $1 = URL
# $2 = download file name
function install_zip_app {
	download_installer $1 $2

	echo "Preparing..."
	cd $WORK_PATH
	unzip "$2"

	install_app $WORK_PATH
}
export -f install_zip_app

# Installs an application via a tar file.
# Parameters:
# $1 = URL
# $2 = download file name
# $3 = uncompress options
function install_tar_app {
	download_installer $1 $2

	echo "Preparing..."
	cd $WORK_PATH
	tar "$3" "$2"

	install_app $temp_path
}
export -f install_tar_app
