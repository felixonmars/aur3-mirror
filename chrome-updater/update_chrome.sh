	    # Chrome

	    export DISPLAY=:0
	 
	   	su `users` -c "echo \"\" > /home/`users | awk '{print $1}'`/.chromeblock";
	   	su `users` -c 'notify-send --icon="google-chrome" "Downloading Chrome AUR package"';
		mkdir -p /tmp/chrome; cd /tmp/chrome;
		wget "http://aur.archlinux.org/packages/go/google-chrome/google-chrome.tar.gz";
		tar -xvf "google-chrome.tar.gz";
		chown -R `users | awk '{print $1}'` /tmp/chrome
		cd /tmp/chrome/google-chrome;
		su `users` -c 'notify-send --icon="google-chrome" "Building Chrome"';
		su `users` -c "makepkg -s -f --noconfirm";
		su `users` -c 'notify-send --icon="google-chrome" "Installing Chrome package"';
		pacman -U google-chrome-*-x86_64.pkg.tar.xz --noconfirm
	   	su `users` -c "rm -rf /home/`users | awk '{print $1}'`/.chromeblock";
	   	su `users` -c "google-chrome"
