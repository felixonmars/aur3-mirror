#!/bin/bash
#download, update and query local exploit database from milw0rm.com
#CopyLefted by Harvie 2oo9 (http://blog.harvie.cz/)
target_dir="/opt/milw0rm"

case "$1" in
	update)
		if [ $UID != 0 ]; then
			echo You must run Milw0rm update as root!;
			exit;
		fi;
		echo "Downloading exploit archive from Milw0rm..."
		mkdir -p "$target_dir"
		cd "$target_dir";
		wget "http://www.milw0rm.com/sploits/milw0rm.tar.bz2"
		echo "Extracting archive..."
		tar jxpf milw0rm.tar.bz2
		rm milw0rm.tar.bz2
		cd milw0rm
		;;
	search)
		cat "$target_dir/milw0rm/sploitlist.txt" | grep -i "$2" | while read line; do
			echo "$target_dir/milw0rm/$line";
		done;
		;;
	usearch)
		$0 update
		$0 search "$2"
		;;
	*)
		echo 'Local Milw0rm.com exploit database tool by Harvie 2oo9 ( http://blog.harvie.cz/ )'
		echo
		echo "Target directory: $target_dir"
		echo "usage: $0 {update|search regexp|usearch regexp}"
esac
