#! /bin/bash

# Identification of the script
name="flac2mp3"
author="Rechosen"
version="1.0"

# The help variables
shorthelp='Usage: '"$(basename "${0}")"' [-b bitrate] [-d dirstoretain] [-l lameopts]
[-o outputdirectory] [-r] FILES'
longhelp='This script uses the tools flac, metaflac and lame to convert flac files to
mp3s. Accepts both individual files and directories (the latter when using the
-r option).

Explanation of the options:
    -b bitrate          Specifies the bitrate of the converted mp3. Defaults to
                        128. Specify a bitrate of "none" to stop the -b option
			from being passed to lame.
    -d dirstoretain     Specifies how many directory names to retain when using
                        both -r and -o. Works from right to left. See the -r
			option for an example.
    -l lameopts         Allows to give custom options to lame. Make sure to
                        surround them with quotes (e.g. -l "-V 6")!
    -o outputdirectory  Specifies the directory to write the mp3s to. If not
                        specified, the mp3s will be written to the directory
			where the flac files are located.
    -r                  Makes the script look for flac files recursively. If
                        this option is specified together with an alternative
			output directory, the mp3s will be written to the
			specified output directory plus the current relative
			path of the flac file. Example:
			"After Edmund/Hello/01_Thank_God.flac"
			will be	converted to
			"<outputdirectory>/After Edmund/Hello/01_Thank_God.mp3."
			
			ATTENTION: When using full paths (like
			/home/user/music/After Edmund/Hello/01_Thank_God.flac),
			you can determine how many directories the script will
			retain using the -d option. With -d 2, the full path
			file just above will be converted to:
			"<outputdirectory>/After Edmund/Hello/01_Thank_God.mp3."
			
    -s                  Do not use this option unless you know what you are
                        doing! It is used internally to self-execute the
			script for conversion.
    -v                  Be verbose; makes the script tell what it is doing.

For more information see http://www.linuxtutorialblog.com/.
No warranty included with this script ;-)                              Rechosen'

# Is the user asking for extensive help?
if [[ "$*" == *--help* ]]; then
	echo -e "$shorthelp""\n""$longhelp"
	exit
fi

# Specify the default variable values
bitrate="128"
dirstoretain=""
lameopts=""
outputdir=""
recursive="-maxdepth 0"
selfexecute="false"
optionstopass=( )
lameoptsarray=( )
verbose=""

# Functions for input validation
function IsNum() {
	if [[ "$1" == *[^0-9]* && "$1" != "none" ]]; then
		echo -e "-$options has to be numeric!\n""$shorthelp"
		exit 1
	fi
}

# Get the passed options
i=0
while getopts ":b:d:l:o:rsv" options; do
	optionstopass[$i]=-"$options"
	(( i++ ))
	if [ "$OPTARG" ]; then
		optionstopass[$i]="$OPTARG"
		(( i++ ))
	fi
	case $options in
		b) IsNum "$OPTARG" && bitrate="$OPTARG";;
		d) IsNum "$OPTARG" && dirstoretain="$OPTARG";;
		l) lameopts="$OPTARG";;
		o) outputdir="$OPTARG";;
		r) recursive="";;
		s) selfexecute="true";;
		v) verbose="true";;
		?) echo $shorthelp; exit 2;;
	esac
done

# Remove parsed options
shift $(($OPTIND - 1))

[ "$verbose" ] && echo "Options parsed. Left on the command-line: ""$*"

# Do we have any files to convert? If not, show usage.
if [ -z "$*" ]; then
	echo -e "No files to convert!\n""$shorthelp"; exit 2
fi

# For drag&drop support: we haven't accidentally got a non-supported URL, do we?
[ "$verbose" ] && echo "Checking for unsupported URLs..."
cmdline=( "$@" )
# Attention: from now on, only ${cmdline[@]} is safe to use to get the files!
for (( i=0; i<${#cmdline[@]}; i++ )); do
	[ "$verbose" ] && echo "Removing any \"file://\" prefixes..."
	cmdline[$i]=${cmdline[$i]#"file://"}
	if [[ "${cmdline[@]}" =~ "^.{1,7}\://" ]]; then
		echo "Sorry, $(basename "$0") only supports local files."
		exit 1
	fi
done

# Make sure $outputdir has an ending "/"
if [ -n "$outputdir" -a "${outputdir:(-1)}" != "/" ]; then
	outputdir=$outputdir"/"
	[ "$verbose" ] && echo "Added a trailing \"/\" to \$outputdir."
fi


# Are we user-called or self-executing?
if [ "$selfexecute" == "false" ]; then
	# Introduce ourselves
	echo "Thanks for using $name $version! This script by $author."
	
	# Find all flac files and re-execute the script once for every file to
	# convert them.
	[ "$verbose" ] && echo "Using find to get the flac files and re-executing the script for each of them."
	find "${cmdline[@]}" $recursive -print0 | grep -zZ -i -E .+\.flac$ |\
	xargs -i -0 "$0" "${optionstopass[@]}" -s {}
else
	# Start an actual conversion; get the file to convert
	[ "$verbose" ] && echo "Getting file to convert..."
	file="$@" # "$@" is safe to use again because of self-execution
	[ "$verbose" ] && echo "File: ""$file"
	# Remove any lame-looking "./" in front of the filename
	if [ "${file:0:2}" == "./" ]; then
		file="${file:2}"
		[ "$verbose" ] && echo "Removed \"./\" from the filename."
	fi
	
	# Get the tags
	[ "$verbose" ] && echo "Getting the tags..."
	i=0
	for tag in {"title","artist","album","tracknumber","date","genre","comment"}; do
		info[$i]=$(metaflac --show-tag=$tag "$file")
		info[$i]=${info[$i]#*=}
		[ "$verbose" ] && echo "Got $tag tag: ""${info[$i]}"
		(( i++ ))
	done

	# Convert the tags to options for lame
	[ "$verbose" ] && echo "Converting tags to lame options..."
	i=0
	for option in {"t","a","l","n","y","g","c"}; do
		if [ "${info[$((i/2))]}" ]; then
			command[$i]=--t$option
			command[$((i+1))]="${info[$((i/2))]}"
			if [ "$option" == "c" ]; then
				command[$((i+1))]=${command[$((i+1))]:0:30}
			elif [ "$option" == "y" ]; then
				command[$((i+1))]=${command[$((i+1))]:0:4}
			elif [ "$option" == "g" ]; then
				if ! lame --genre-list 2>&1 | grep "${command[$((i+1))]}" >/dev/null; then
					command[$((i+1))]=""
					[ "$verbose" ] && echo "Nullified the genre tag as the specified genre does not exist."
				fi
			fi
		fi
		i=$(($i+2))
	done
	[ "$verbose" ] && echo "Lame options: ""${command[@]}"

	# Prepare the outputfile variable
	[ "$verbose" ] && echo "Preparing \$outputfile..."
	basefile=$(basename "$file")
	if [ -z "$outputdir" -o -z "$recursive" ]; then
		# We're going to extend the outputdir using the source dir(s)
		# Checking if we need to limit the amount of source dirs retained...
		if [ -n "$dirstoretain" ]; then
			retaineddirs=""
			filedir=$(dirname "$file")
			i=0
			while [ $i -lt $dirstoretain -a -n "$filedir" ]; do
				dirtoretain=`expr "$filedir" : '.*\(/[^/]\+\)'`
				filedir=${filedir%$dirtoretain}
				dirtoretain=${dirtoretain:1}"/"
				retaineddirs="$dirtoretain""$retaineddirs"
				(( i++ ))
			done
			outputfile="$outputdir""$retaineddirs""${basefile/.[fF][lL][aA][cC]/.mp3}"
		else
			# Just throw in all dirs
			outputfile="$outputdir""${file/.[fF][lL][aA][cC]/.mp3}"
		fi
	else
		outputfile="$outputdir""${basefile/.[fF][lL][aA][cC]/.mp3}"
	fi
	[ "$verbose" ] && echo "\$outputfile is ""$outputfile"". Creating directories if needed..."
	mkdir -p "$(dirname "$outputfile")"
	
	# Prepare the bitrate
	[ "$verbose" ] && echo "Preparing bitrate..."
	if [ -n "$bitrate" -a "$bitrate" != "none" ]; then
		bitratearray=( "-b" "$bitrate" )
	fi
	
	# Make the lameopts usable
	[ "$verbose" ] && echo "Making \$lameopts usable."
	i=0
	for l in $lameopts; do
		lameoptsarray[$i]="$l"
		(( i++ ))
	done
	
	# Actual conversion coming up...
	[ "$verbose" ] && echo "Preparing progress indicator..."
	# Now for the great trick... a progress indicator!
	flacsize=$(stat -c %s "$file")
	blocksize=$(( flacsize / 100 ))
	if [ $blocksize -le 0 ]; then
		blocksize=1
	fi
	ddcount=$(( $blocksize / 512 ))
	if [ $blocksize -le 0 ]; then
		ddcount=1
	fi
	donesofar=0
	percent=0
	start=$(date +%s)
	echo -n "Converting $file to $outputfile..."
	printf "%4s%%" 0
	printf "   Time left: %02d:%02d" 0 0
	cat "$file" | (
	while [ $donesofar -lt $flacsize ]; do
		dd bs=512 count=$ddcount 2>/dev/null
		(( donesofar += $blocksize ))
		
		percent=$(( 100 * $donesofar / $flacsize ))
		echo -n -e "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b" 1>&2
		printf "%4s%%" $percent 1>&2
		
		# Calculate the estimated time left
		timeelapsed=$(( $(date +%s) - $start ))
		if [ $timeelapsed -gt 0 ]; then
			bytespersec=$(( $donesofar / $timeelapsed ))
			totaltimeest=$(( $flacsize / $bytespersec + 2 )) # "+ 2" is a correction because flac and lame need to finish up
			timeleft=$(( $totaltimeest - $timeelapsed ))
			timeleftmin=$(( $timeleft / 60 ))
			timeleftsec=$(( $timeleft % 60 ))
			printf "   Time left: %02d:%02d" $timeleftmin $timeleftsec 1>&2
		else
			printf "   Time left: %02d:%02d" 0 0 1>&2
		fi
	done
	) | flac -cds - |\
	lame -hS "${bitratearray[@]}" "${lameoptsarray[@]}" "${command[@]}" - "$outputfile"
	echo -e "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b Done.                  "
fi