#!/bin/bash
#
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo "#######################    START      ##########################"
echo "# Checking for git is installed"

	# check if git is installed
	if which git > /dev/null; then
		echo "## git was installed"

		else

		echo "## installing git for this script to work"
	  	sudo dnf install git -y
	fi

echo "# Clean up old files if needed"
# if there is already a folder in tmp then delete
[ -d /tmp/mint-y-theme ] && rm -rf "/tmp/mint-y-theme" || echo ""
# download to the folder /tmp/mint-y-theme

git clone https://github.com/linuxmint/mint-y-theme.git /tmp/mint-y-theme

echo "# Install sass"
dnf install ruby gcc mysql-devel ruby-devel rubygems
gem install sass bundler rails compass

echo "# Building"
cd /tmp/mint-y-theme/src
/tmp/mint-y-theme/src/build-themes.py

echo "# Copy new themes"
sudo cp -r /tmp/mint-y-theme/usr/share/themes/* /usr/share/themes/

echo "# Clean up"
rm -rf /tmp/mint-y-theme

echo "########################    END      ###########################"
