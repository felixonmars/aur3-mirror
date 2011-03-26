#!/bin/bash

# Wrapper script for sdx, to facilitate the creation of starkits (including cross-platform builds)
# Created for the ArchLinux sdx package, licensed under the same conditions as sdx
# Copyright: Simon Bachmann (simonbachmann@freesurf.ch), 2007


APPNAME=$0
TCLKIT_DIR=/usr/share/sdx/tclkits
SDX=/usr/bin/sdx

print_help () {

case $1 in 

	"")
	
cat << EOF
 
$APPNAME is a script that extends sdx to make it easier to create starkits.

For more informations about sdx type: $APPNAME sdxhelp ?command?
For more informations about $APPNAME type: $APPNAME help ?command?
	
EOF
;;

	"help")
cat << EOF
Specify one of the following commands:
  sdxhelp	Access the sdx help
  wrap		Extended wrap command
  listkits	Display a list of all available tclkits

For more information type: $APPNAME help ?command?

EOF
;;

	sdxhelp)
cat << EOF

 Access the sdx help
 
	Usage: sdxhelp ?command?
	
	command		Sdx command to get more information about
	
	With no command specified, a list of all sdx commands 
	with a short description is displayed.
	
EOF
;;

	wrap)
cat << EOF

 Extended wrap command
 
	Usage: wrap name ?options?
	
	-runtime	name	The runtime tclkit to use, one of the
				names returned by "listkits"
	-runtimefile	file	Specifiy runtime with full path 
	
	All other options are unchanged. See 'sdx help wrap' for details.
	
EOF
;;
	
	listkits)
cat << EOF

 Display a list of all available tclkits
 
	Usage: listkits
	
	The name of each tclkit should tell you for wich platform
	it was built. To add more tclkits, just copy them to
	$TCLKIT_DIR
	
EOF
;;

	*)
		print_help help ;;

esac

}

sdxhelp () {
	$SDX help $@
}

wrap () {
	search_kits
	while [ "$1" != "" ]; do
	 	case $1 in
	 		-runtime)
	 			shift
	 			i=`search_array KITS $1`
	 			if [ "$i" != "-1" ]; then
	 				options="$options -runtime ${PATHS[$i]}"
	 			else 
	 				echo -e "Starkit named $1 does not exist\n"
	 				listkits
	 				exit
	 			fi			
	 			
	 			;;
	 		-runtimefile)
	 			shift
	 			options="$options -runtime $1"
	 			;;
	 		*)

				options="$options $1"
				;;
		esac
	 	shift
	done
	
	$SDX wrap $options
}

listkits () {
	search_kits
	echo -e "These tclkits are available:\n"
	for k in "${KITS[@]}"; do
		echo -e "\t$k"
	done
	echo 
}

search_array () {
	eval arr="( \${$1[@]} )"
	found="-1"
	ret=1
	for (( i=0 ; $i < ${#arr[@]} ; i+=1)); do
		if [ "${arr[$i]}" = "$2" ]; then
			found=$i
			ret=0
		fi
	done
	
	echo $found
	return $ret
}


#search tclkits
search_kits () {
	i=0
	for path in "$TCLKIT_DIR"/*; do
		k=`basename "$path"`
		if [ -r "$path" -a  -x "$path" ]; then 
			KITS[$i]="$k"
			PATHS[$i]="$path"
			let i+=1
		fi
	done
}

#for debug
#echo "Found kits: ${KITS[@]}"
#echo "Found paths: ${PATHS[@]}"

#parse subcommands
case $1 in 
	"")
		print_help ;;
		
	sdxhelp)
		shift
		sdxhelp $@ ;;
	 
	wrap) 
		shift
		wrap $@ ;;
		
	listkits) 
		shift
		listkits $@ ;;
		
	help) 
		shift
		if [ "$1" = "" ]; then
			print_help help
		else
			print_help $1
		fi
		;;

	"--help" | "-h")
		print_help ;;
	
	*)
		$SDX $@ ;;

esac

