#!/bin/sh
#
# foldingathome-gpu-wrapper: Start or configure the Folding@Home GPU client (via Wine).
#

display_help_page() {
	cat <<EOF 1>&2
Usage: foldingathome-gpu-wrapper [OPTION]...
Start or configure the Folding@Home GPU client (via Wine).

Options:
  -h  Display this page and exit.
  -w  The working directory for Folding@Home and Wine.  If it
      doesn't exist, it will be created.  If this isn't set,
      this script will use "./foldingathome-gpu-work".
  -c  Create a symlink to a Folding@Home configuration file in
      the working directory.  This is usually named
      "client.cfg".  If this is not set, this script will use
      "client.cfg" in the working directory.
  -g  The GPU ID to use.  If this is not set, this script will
      default to 0.
  -C  Configure Folding@Home.  If -c isn't set, it will default
      to "./client.cfg".
  -f  Flags to pass as options to the Folding@Home client by
      this script.  If this isn't set, this script will try to
      read a file called "flags" in the working directory.  If
      "flags" doesn't exist, this script will default to
      "-forcegpu nvidia_fermi -verbosity 9".
EOF
}

while getopts c:w:g:f:Ch option; do
	case "$option" in
		c)
			client_cfg="$OPTARG"
			;;
		w)
			working_directory="$(realpath "$OPTARG")"
			;;
		g)
			case "$OPTARG" in
				*[![:digit:]]*)
					echo "-g: \"$OPTARG\" is an invalid GPU ID." 1>&2
					display_help_page
					exit 1
					;;
				*)
					gpu_flag="-gpu $OPTARG"
					;;
				esac
			;;
		C)
			working_directory="/tmp/$(basename $0)-$$"
			[ -z $client_cfg ] && client_cfg="$PWD/client.cfg"
			config_only=1
			;;
		f)
			flags="$OPTARG"
			;;
		h)
			display_help_page
			exit
			;;
		?)
			display_help_page
			exit 1
			;;
	esac
done

current_directory="$PWD"
working_directory="${working_directory:-$PWD/foldingathome-gpu-work}"

if [ ! -d "$working_directory" ]; then
	mkdir "$working_directory" || exit 1
fi
cd "$working_directory"

if [ -z $flags ]; then
	flags="$(cat flags 2>/dev/null)" || \
		flags="-forcegpu nvidia_fermi -verbosity 9"
fi

if [ -z $config_only ]; then
	export WINEPREFIX="$working_directory"
else
	[ -z $client_cfg ] && client_cfg="$PWD/client.cfg"
fi

if [ ! -z $client_cfg ]; then
	ln -sf "$client_cfg" || exit 1
fi

ln -sf /opt/foldingathome-gpu/cudart.dll.so cudart32_30_14.dll && \
	ln -sf /opt/foldingathome-gpu/cufft.dll.so cufft32_30_14.dll || exit 1

export LD_LIBRARY_PATH="/opt/foldingathome-gpu:$LD_LIBRARY_PATH"
wine /opt/foldingathome-gpu/Folding@home-Win32-gpu.exe \
	$flags $gpu_flag ${config_only:+-configonly}

if [ ! -z $config_only ]; then
	cd "$current_directory"
	rm -r "$working_directory"
fi
