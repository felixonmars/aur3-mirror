#!/bin/bash
# ALAC/APE to FLAC converter script
# License: GPLv3
# Author:  m0rph
# Email:   m0rph.mailbox@gmail.com


check_program()
{
    type -P "$1" &>/dev/null
    if [ $? != 0 ]; then
	echo "error: unable to find $1, please install required package and try again"
	exit 1
    fi
}


print_header()
{
    echo "many2flac converter version 1.14, (c) m0rph, 2011"
    echo "email: m0rph.mailbox@gmail.com"
    echo "supported input formats: ALAC, APE"
    echo ""
}


print_help()
{
    echo "usage:   $(basename "${0}") [options] <input file(s)>"
    echo "options:"
    echo "         -h, --help         display this help and exit"
    echo "         -e, --erase        erase input file(s) after success conversion"
    echo "         -f, --force        force overwrite output file(s)"
    echo "         -n, --native-flac  use native flac encoder instead of ffmpeg"
    echo "         -r, --replay-gain  calculate ReplayGain and store in FLAC tags"
    echo "         -0, --fast         use compression level 0"
    echo "         -1                 use compression level 1"
    echo "         -2                 use compression level 2"
    echo "         -3                 use compression level 3"
    echo "         -4                 use compression level 4"
    echo "         -5                 use compression level 5"
    echo "         -6                 use compression level 6"
    echo "         -7                 use compression level 7"
    echo "         -8, --best         use compression level 8"
    echo ""
}


check_format()
{
    format=$(ffmpeg -i "$1" 2>&1 | grep "Audio: " | cut -d ',' -f 1 | cut -d ' ' -f 8)
    if [[ $format != "alac" && $format != "ape" ]]; then
        return 1
    fi
}


process_file()
{
    ffmpeg -y -i "$1" -aq $compression "$2" &> /dev/null

    if [ $replay_gain_flag == 1 ]; then
        flac --force --replay-gain "$2" &> /dev/null
    fi
}


process_file_native()
{
    title=$(ffmpeg -i "$1" 2>&1 | grep -i "    title           :" | cut -d ':' -f 2 | sed 's/^ *//')
    artist=$(ffmpeg -i "$1" 2>&1 | grep -i "    artist          :" | cut -d ':' -f 2 | sed 's/^ *//')
    album=$(ffmpeg -i "$1" 2>&1 | grep -i "    album           :" | cut -d ':' -f 2 | sed 's/^ *//')
    year=$(ffmpeg -i "$1" 2>&1 | grep -i "    date            :" | cut -d ':' -f 2 | sed 's/^ *//')
    track=$(ffmpeg -i "$1" 2>&1 | grep -i "    track           :" | cut -d ':' -f 2 | sed 's/^ *//')
    genre=$(ffmpeg -i "$1" 2>&1 | grep -i "    genre           :" | cut -d ':' -f 2 | sed 's/^ *//')

    pipe=`mktemp -u -t many2flac.pipe.XXXXXX`
    mkfifo "$pipe"
    mplayer -ao pcm -ao pcm:file="$pipe" "$1" -noconsolecontrols &> /dev/null &
    if [ $replay_gain_flag == 1 ]; then
        flac --force "$pipe" --replay-gain -$compression          \
        -T title="$title" -T artist="$artist" -T album="$album"   \
        -T date="$year" -T tracknumber="$track" -T genre="$genre" \
        -o "$2" &> /dev/null
    else
        flac --force "$pipe" -$compression                        \
        -T title="$title" -T artist="$artist" -T album="$album"   \
        -T date="$year" -T tracknumber="$track" -T genre="$genre" \
        -o "$2" &> /dev/null
    fi
}


print_header

compression=5
erase_flag=0
force_flag=0
native_flag=0
replay_gain_flag=0
files=()

while [[ $# > 0 ]]; do
    case "$1" in
    -h|--help)
        print_help
        exit 0
        ;;
    -e|--erase)
        erase_flag=1
        ;;
    -f|--force)
        force_flag=1
        ;;
    -n|--native-flac)
        native_flag=1
        ;;
    -r|--replay-gain)
        replay_gain_flag=1
        ;;
    -0|--fast)
        compression=0
        ;;
    -1)
        compression=1
        ;;
    -2)
        compression=2
        ;;
    -3)
        compression=3
        ;;
    -4)
        compression=4
        ;;
    -5)
        compression=5
        ;;
    -6)
        compression=6
        ;;
    -7)
        compression=7
        ;;
    -8|--best)
        compression=8
        ;;
    *.ape|*.m4a)
        if [ ! -f "$1" ]; then
            echo "error: unable to find \"$1\" file"
            echo ""
            exit 1
        fi
        files=("${files[@]}" "$1")
        ;;
    -?|--*)
        echo "error: invalid option $1"
        echo ""
        exit 1
        ;;
    *)
        echo "error: invalid argument: \"$1\""
        echo ""
        exit 1
        ;;
    esac

    shift
done


if [[ ${#files[@]} == 0 ]]; then
    echo "error: no input files"
    echo ""
    exit 1
fi

check_program ffmpeg
check_program flac
check_program mplayer

for input_file in "${files[@]}"; do
    check_format "$input_file"
    if [ $? != 0 ]; then
        echo "$input_file: unsupported format"
        continue
    fi

    echo -n "converting $input_file"
    output_file=${input_file%.*}.flac
    if [[ -f "$output_file" && $force_flag == 0 ]]; then
        echo " - failure (file exists)"
        continue
    fi

    if [ $native_flag == 1 ]; then
        process_file_native "$input_file" "$output_file"
    else
        process_file "$input_file" "$output_file"
    fi

    if [ $? == 0 ]; then
        echo " - done"
        if [ $erase_flag == 1 ]; then
            rm "$input_file"
        fi
    else
        echo " - failure"
    fi

done
