#!/bin/bash
#Copylefted by: Harvie 2o1o
version='1.1';
filetypes='(mp3|wav|wma)$'; #regex
quality="$1"; #passed to lame as --preset argument
outdir="_lame-encoded-preset-"; #preset name will be attached - needs to be regex compatible string

#guess count of CPU cores
cpus=1;
cpusguess=$(grep 'processor.:' /proc/cpuinfo 2>/dev/null | wc -l);
[ "$cpusguess" -ge 1 ] 2>/dev/null && cpus="$cpusguess"
[ "$2" -ge 1 ] 2>/dev/null && cpus="$2"

lamelog='/dev/null'
[ "$cpus" -eq 1 ] && lamelog='/dev/stdout'

[ -z "$1" ] && {
echo -e "lame-recursive v$version (Harvie 2o1o)

	(Re-)Encode all '$filetypes' files in current directory and (sub-directories)
	- This will NOT touch the original files.
	- This will only create new files in ${outdir}PRESET directory in each
	  sub-directory, where PRESET will be substitued by selected lame preset.
	- Files in such directories will be ignored
	- Once encoded file will be overwriten only if it's older than original file
	- Requires working lame binary
	- Supports multiple CPUs/cores

	Usage:  	$0 [preset] [cpu-cores]
	Example:	cd ~/music;	$0 standart
	Example:	cd ~/spoken;	$0 voice

presets:	
	VBR: voice, medium, standart, extreme, insane (= 320kbps CBR)
	ABR: 8, 16, 32, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320
	For more info:	lame --preset help

cpu-cores:
	You probably have $cpusguess CPU cores, i will use this value by default
	Anyway... You can try any value higher than 0
	(does not affect sound quality, probably you don't need to change this)
"
exit;
}

encode() {
	tsign() { echo -ne "[$$]\t"; echo "$@"; }
	temp=$(mktemp)
	cleanup() {
		last=$(cat "$temp");
		echo -ne "\n[$$] Terminated. Deleting incomplete file:\n\t"
		echo "$last"
		rm -f "$last";
		rm -rf "$temp";
		exit;
	}
	trap cleanup SIGINT SIGTERM SIGHUP SIGPIPE SIGQUIT SIGKILL;


	infile="$1"
	cd "${infile%/*}";
	outdir="${outdir}${quality}"
	[[ -d "$outdir" ]] || {
		echo "==> Creating directory: $(pwd)/$outdir";
		mkdir -p "$outdir";
	}
	infile="${infile##*/}";
	outfile="$outdir/${infile##*/}";

	[ "$outfile" -nt "$infile" ] && {
		tsign "Output file is newer than input file: $(pwd)/$outfile";
		exit;
	}

	echo "$(pwd)/$outfile" > "$temp"
	tsign "Encoding: '$infile'";
	lame --preset "$quality" "$infile" "$outfile" >"$lamelog" 2>&1
	tsign "    Done: '$infile'; retval=$?";
}

echo "==> I will use $cpus CPU cores";	
export -f encode; export quality outdir lamelog
find -regextype posix-egrep -iregex '.*'"$filetypes" | grep -v /"$outdir" | tr '\r\n' '\0\0' | xargs -0 -n 1 -P "$cpus" bash -c 'encode "$@"' --
echo '

==> All files were processed. 
==> But you should rather check them before deleting the originals...
==> Thank you for using lame-recursive by Harvie ( http://blog.harvie.cz/ )'
