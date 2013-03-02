#!/bin/sh

# /usr/bin/oangband

    # is oangband installed? 

if [[ -f "/opt/oangband/oangband" ]]; then
    # yes, then 
	
	# is the current user testing out a newer build than the one that is installed?
    if [[ -f "/opt/oangband/docs/release-al.txt" ]]; then
	export current_rel="X" # during buildtime, 'X' is replaced with the current version.  
	export installed_rel=$(echo -n /opt/oangband/docs/release-al.txt)
	if [[ $current_rel = $installed_rel ]]; then
	    cd "/opt/oangband";
	    ./oangband;
#	    cd "$OLDPWD";
	else
	    cd "../../opt/oangband";
	    ./oangband;
	    # I'm not sure if this will actually move the user around or not, so I thought I better add the following.  
#	    cd "$OLDPWD";
	fi
    else
	cd "../../opt/oangband";
	./oangband;
    fi
else
    cd "../../opt/oangband";
    ./oangband;
fi


