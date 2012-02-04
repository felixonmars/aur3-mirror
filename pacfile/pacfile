#!/bin/bash

#-----------------------------------------------------------
# A utility for discovering which ArchLinux package contains 
# a given file. Downloads filelists for all active repos in
# pacman.conf; uses mirrors in order according to pacman's
# mirrorlist file.
#
# Peter Morris 2008
#
# Modified by tuxce.net@gmail.com
#-----------------------------------------------------------

db=/var/lib/pacman/filelists
pacmanconf=/etc/pacman.conf

#-----------------------------------------------------------
# Print active repos in $pacmanconf.
#-----------------------------------------------------------
function list_repos() {
    sed -n '/REPOSITORIES/,$ s/^\[\(.*\)\]/\1/p' $pacmanconf
}

#-----------------------------------------------------------
# Download the filelist for repo $1. Assumes $mirrors
# is an array of urls to check for $file.
#-----------------------------------------------------------
function download() {
    repo=$1
    file="${repo}.files.tar.gz"
	shift
    #for mirror in $(eval echo \${$repo[*]})
    for mirror in $*
    do
      wget --connect-timeout=15 -P "$db" "$mirror/${file}"
      [ -e "${db}/${file}" ] && break
    done
}

#-----------------------------------------------------------
# Decompress $1 into dir $2.
#-----------------------------------------------------------
function decompress() {
    file=$1
    repo=$2

    mkdir "${db}/${repo}"
    tar -xzf "${db}/${file}" -C "${db}/${repo}"
    rm -f "${db}/${file}"
}

#-----------------------------------------------------------
# Download the filelist for each active repo in 
# pacman.conf. Try mirrors in order until successful.
#-----------------------------------------------------------
function sync() {
	(LC_ALL=C pacman --debug  | grep 'adding new server' \
		| sed "s|.*adding new server URL to database '\(.*\)': \(.*\)|\1 \2|g"
		echo) | while read repo_cur url
	do
		[ -z "$repo_ex" ] && repo_ex=$repo_cur
		if [ "$repo_ex" != "$repo_cur" ] 
		then
			echo "Fetching filelist for $repo_ex"
			download "$repo_ex" "${list[@]}"
			if [[ $? == 0 ]]; then
				decompress "$file" "$repo_ex"
			else
				echo
				echo "Error: unable to retrieve $file from any mirror."; echo
			fi
			repo_ex=$repo_cur
			list=( )
		fi
		list=( "${list[@]}" $url )
	done
}

#-----------------------------------------------------------
# Print usage message.
#-----------------------------------------------------------
function usage() {
    echo "usage: $(basename $0) [options] [pattern]"
    echo 
    echo "Search package filelists for [pattern]."
    echo "options:"
    echo "  $(basename $0) [-h --help]      Print this help message."
    echo "  $(basename $0) [-S --sync]      Syncronize package filelists."
}

#-----------------------------------------------------------
# Start of `main'.
#-----------------------------------------------------------
case "$1" in
    -S|--sync)
        if [[ $EUID != 0 ]]; then
            echo "error: you cannot perform this operation unless you are root."
            exit 1;
        fi    

        echo "Syncronizing ${db}..."; echo
        rm -rf "$db" && mkdir -p "$db"
        sync
    ;;

    -h|--help)
        usage
    ;;

    *)
        if [[ $# < 1 ]]; then
            echo "not enough parameters"; echo
            usage
            exit 1
        fi

        if [[ ! -d "$db" ]]; then
            echo "File database \"$db\" does not exist!"
            echo "Have you synchronized the database?"; echo
            exit 1
        fi

        grep -rE "$@" "$db" | sed  "s|$db/\(.*\)/files:|\1 |g"
    ;;
esac
