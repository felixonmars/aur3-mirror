	    // My Chrome

	    export DISPLAY=:0
	 
	   	su `users` -c "echo \"\" > /home/`users | awk '{print $1}'`/.chromeblock";
	   	su `users` -c 'notify-send "Downloading Chrome"';
		mkdir -p /tmp/chrome; cd /tmp/chrome;

		if [[ `uname -m` == "x86_64" ]]; then
			wget --continue "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb";
		else
			wget --continue "https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb";
		fi

		mkdir -p extract; cd extract;
		ar p ../google-chrome-stable_current_amd64.deb data.tar.lzma | lzma -d | tar x

		
		su `users` -c 'notify-send "Update Permissions"';
		if [[ `cd /opt/google/chrome; ls -l | grep google-chrome | awk '{print $3}'` == "root" ]]
			then
			chown -R `users` /opt/google;
			fi

	   cd /opt/google/; rm -rf chrome;
	   cd /tmp/chrome/extract/opt/google; 
	   mv chrome /opt/google;
	   ln -s /usr/lib/libudev.so /opt/google/chrome/libudev.so.0
	   cd /opt/google/chrome/
	   su `users` -c 'notify-send "Change Permissions for Sandbox"';
	   chown root /opt/google/chrome/chrome-sandbox && sudo chmod 4755 /opt/google/chrome/chrome-sandbox
	   su `users` -c "rm -rf /home/`users | awk '{print $1}'`/.chromeblock";
	   
	   su `users` -c "google-chrome"
