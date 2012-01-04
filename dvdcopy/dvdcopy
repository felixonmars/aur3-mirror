#!/bin/bash
#
# pbrisbin 2009, 2010, 2011
#
###

logger()   { echo -e "$(date +'[ %d %b %H:%M ]') :: $*"; }
errorout() { echo -e "\aerror: $*" >/dev/stderr; exit 1; }

process_error() { # {{{
  if $keep_going; then
    echo "warning: $*" >&2
  else
    errorout "$*"
  fi
}
# }}}

with_ionice() { # {{{
  if $ionice; then
    ionice -t -c 3 "$@"
  else
    "$@"
  fi
}
# }}}

prompt() { # {{{
  echo -en "\a$*? [Y/n/q] " && read A

  case "${A:-y}" in
    Y|y) return 0 ;;
    Q|q) exit 1   ;;
    *)   return 1 ;;
  esac
} # }}}

requirements() { # {{{
  local reqs=('awk' 'perl' 'tcprobe' 'vobcopy'
              'mencoder' 'dvdauthor' 'mkisofs'
              'growisofs')

  for req in ${reqs[@]}; do
    which $req &>/dev/null || errorout "$req required, not installed."
  done
} # }}}

make_clean() { # {{{
  logger 'cleaning up after last time...'
  rm -rf "$directory"; mkdir -p "$directory"
} # }}}

cleanup() { # {{{
  if ! $keep_files; then
    logger 'cleaning up...'
    rm -rf "$directory"
  fi

  logger 'done.'
} # }}}

get_dvd_info() { # {{{
  local count=0 ch_found=true

  logger 'gathering DVD info...'

  false; while [[ $? -ne 0 ]]; do
    [[ $count -gt $limit ]] && errorout "vobcopy failed loading the disc $limit times"

    count=$((count+1))
    sleep 1 && vobcopy -I "$device" &> "$directory/title.txt"
  done

  [[ -z "$title" ]] && title="$(awk '/Most\ chapters/ {print $6}' "$directory/title.txt")"

  name="$(awk '/Name\ of\ the\ dvd/ {print $6}' "$directory/title.txt")"

  name_lower="${name,,}"
  name_lower="${name_lower// /_}"

  # get a/v and chapter info
  tcprobe -i "$device" -T $title -d 8 &> "$directory/probe.txt" || errorout 'tcprobe failed reading disc'

  grep -E "\[Chapter ..\] " "$directory/probe.txt" | cut -d " " -f 4 | \
    perl -pi -e 's/\n/,/' | perl -pi -e 's/,$//' > "$directory/ch.list" || process_error 'failed to parse chapters listing.'

  # a check on the chapters, so far it can always be fixed by picking
  # title 1
  if ! grep -q '[1-9]' "$directory/ch.list"; then
    prompt 'no chapters were found, continue' || exit 1
    ch_found=false
  fi

  # calculate vbr to stay under $size
  vbr=$(awk -v size=$size '
    /^V\:/ { l = $4   }
    /^A\:/ { a = $5/8 }
    END {
      printf("%d\n", (((size-(a*l))/l)*8) + 0.5)
    }' "$directory/probe.txt")

  logger "found device   : $device"
  logger "found title    : $title"
  logger "found name     : $name_lower"
  logger "found bitrate  : $vbr kbit/s"

  if $ch_found; then
    logger "found chapters : "

    chapters=( $(sed 's/\,/\n/g' "$directory/ch.list") )

    for ((i=0; i<${#chapters[@]}; i++)); do
      logger "               : chapter $((i+1))\t${chapters[$i]}"
    done
  fi

  $info_only && exit 0
} # }}}

make_mpeg() { # {{{
  local options

  logger 'encoding video...'

  if [[ -n "$mencoder_options" ]]; then
    options="$mencoder_options"
    logger "adding mencoder option(s) \`$options'..."
  fi

  mencoder dvd://$title -dvd-device "$device" $options \
    -mc 0 -of mpeg -mpegopts format=dvd:tsaf \
    -oac copy -ovc lavc -vf scale=720:480,pullup,softskip,harddup \
    -lavcopts vcodec=mpeg2video:vrc_buf_size=1835:vrc_maxrate=9800:vbitrate=${vbr}:keyint=18:vstrict=0:aspect=16/9:ilme:ildct \
    -ofps 24000/1001 -o "$directory/movie.mpeg" || process_error "mencoder failed reading disc"

  # save it if desired
  [[ -n "$mpeg_dir" ]] && with_ionice cp -v "$directory/movie.mpeg" "$mpeg_dir/$name_lower.mpeg"

  # exit if desired
  $mpeg_only && exit 0
} # }}}

author_dvd() { # {{{
  logger "authoring DVD..."

  if [[ -f "$directory/ch.list" ]]; then
    with_ionice dvdauthor -t -c $(cat "$directory/ch.list") -o "$directory/MOVIE" "$directory/movie.mpeg" || process_error 'dvdauthor failed writing movie'
  else
    with_ionice dvdauthor -t -o "$directory/MOVIE" "$directory/movie.mpeg" || process_error 'dvdauthor failed writing movie'
  fi

  with_ionice dvdauthor -T -o "$directory/MOVIE" || process_error 'dvdauthor failed writing title'

  # save it if desired
  [[ -n "$dvd_dir" ]] && with_ionice cp -rv "$directory/MOVIE" "$dvd_dir/${name_lower^^}"

  # exit if desired
  $dvd_only && exit 0
} # }}}

build_iso() { # {{{
  logger 'generating ISO...'

  with_ionice mkisofs -dvd-video -o "$directory/movie.iso" "$directory/MOVIE" || process_error 'mkisofs failed creating image'

  # save it if desired
  [[ -n "$iso_dir" ]] && with_ionice cp -v "$directory/movie.iso" "$iso_dir/$name_lower.iso"

  # exit if desired
  $iso_only && exit 0
} # }}}

burn_iso() { # {{{
  local count

  eject "$device" || logger 'eject failed'

  if prompt 'please insert blank medium, continue'; then
    logger 'burning image to disc...'

    # growisofs will fail as we're loading the disc; we'll keep trying
    # until we succeed or reach $limit
    count=0
    false; while [[ $? -ne 0 ]]; do
      [[ $count -gt $limit ]] && process_error "growisofs failed burning image $limit times"

      count=$((count+1))
      sleep 1 && growisofs -dvd-compat -Z $device="$directory/movie.iso"
    done

    sleep 5; eject "$device" || logger 'eject failed'
  fi
} # }}}

message() { # {{{
  cat << EOF

  usage: dvdcopy [ --option(=<argument>) ] [...]

    ~/.dvdcopy.conf will be read first if it's found (even if --config
    is passed). for syntax, see the help entry for the --config option.
    commandline arguments will overrule what's defined in the config

    options:

      --config=<file>               read any of the below options from a
                                    file, note that you must strip the
                                    '--' and set any argument-less
                                    options specifically to either true
                                    or false

                                    this file must be valid bash syntax

                                    there is no error on malformed or
                                    non-existent <file>s

      --directory=<directory>       set the working directory, default
                                    is ./dvdcopy

      --keep_files                  keep all intermediate files; note
                                    that they will be removed the next
                                    time dvdcopy is run regardless of
                                    this option

                                    use a different --directory to keep
                                    files across multiple runs

      --keep_going                  by default, the process ends if one
                                    of the sub-steps reports a non-zero
                                    exit status; pass this flag to keep
                                    going

      --device=<file>               set the reader/burner, default is
                                    /dev/sr0

                                    dvdcopy currently does not support
                                    separate devices for reading/burning

      --title=<number>              set the title, default is longest

      --size=<number>               set the desired output size in KB, 
                                    default is 4193404, DVD5

      --limit=<number>              set the number of times to attempt a
                                    read/burn before giving up, default
                                    is 15

      --info_only                   stop after printing the dvd information
      --mpeg_only                   stop after transcoding the mpeg
      --dvd_only                    stop after authoring the dvd
      --iso_only                    stop after generating the iso

      --mpeg_dir=<directory>        set a save location for the
                                    intermediate mpeg file, default is
                                    blank -- don't save it

      --dvd_dir=<directory>         set a save location for the
                                    intermediate vob folder, default is
                                    blank -- don't save it

      --iso_dir=<directory>         set a save location for the
                                    intermediate iso file, default is
                                    blank -- don't save it

      --mencoder_options=<options>  pass additional arbitrary arguments
                                    to mencoder, multiple options should
                                    be quoted and there is no validation
                                    on these; you'll need to know what
                                    you're doing. the options are placed
                                    after '-dvd-device <device>' but
                                    before all others

      --quiet                       be quieter
      --verbose                     be more verbose

      --force                       disable any options validation,
                                    useful if ripping from an image file

      --ionice                      use ionice (if available) with
                                    I/O-heavy commands

      --help                        print this

EOF

  exit 1
} # }}}

set_defaults() { # {{{
  config="$HOME/.dvdcopy.conf"

  directory="$PWD/dvdcopy"
  keep_files=false
  keep_going=false

  device='/dev/sr0'
  title=''
  size=4193404
  limit=15

  info_only=false
  mpeg_only=false
  dvd_only=false
  iso_only=false

  mpeg_dir=''
  dvd_dir=''
  iso_dir=''

  mencoder_options=''

  quiet=false
  verbose=false
  force=false
  ionice=false

  exec 2>/dev/null
} # }}}

parse_options() { # {{{
  [[ -f "$config" ]] && . "$config" # get user config

  while [[ -n "$1" ]]; do
    case "$1" in
      --config=*)      . "${1#*=}" 2>/dev/null ;;
      --info_only)     info_only=true          ;;
      --mpeg_only)     mpeg_only=true          ;;
      --dvd_only)      dvd_only=true           ;;
      --iso_only)      iso_only=true           ;;
      -k|--keep_files) keep_files=true         ;;
      -g|--keep_going) keep_going=true         ;;
      -q|--quiet)      quiet=true              ;;
      -v|--verbose)    verbose=true            ;;
      -f|--force)      force=true              ;;
      -n|--ionice)     ionice=true             ;;
      -h|--help)       message                 ;;

      # all other options are handled by a simple eval, we rely on the
      # case pattern to do the validation
      --directory=*|--device=*|--title=*|--size=*|--limit=*|--mpeg_dir=*|--dvd_dir=*|--iso_dir=*|--mencoder_option=*)
        eval "${1/--/}" ;;

      *) message ;;
    esac
    shift
  done
} # }}}

validate_options() { # {{{
  if ! $force; then
    # directory must exist
    [[ ! -d "$directory" ]] && errorout "$directory: does not exist"

    # device must be an optical drive
    [[ ! -b "$device" ]] && errorout "$device: not an optical drive"

    # these need to be numeric
    [[ -n "${title//[0-9]/}" ]] && errorout "$title: non-numeric"
    [[ -n "${size//[0-9]/}" ]]  && errorout "$size: non-numeric"
    [[ -n "${limit//[0-9]/}" ]] && errorout "$limit: non-numeric"

    # if specified, these need to exist
    [[ -n "$mpeg_dir" ]] && [[ ! -d "$mpeg_dir" ]] && errorout "$mpeg_dir: does not exist"
    [[ -n "$dvd_dir" ]]  && [[ ! -d "$dvd_dir" ]]  && errorout "$dvd_dir: does not exist"
    [[ -n "$iso_dir" ]]  && [[ ! -d "$iso_dir" ]]  && errorout "$iso_dir: does not exit"
  fi

  # set derived options
  $mpeg_only && mpeg_dir="${mpeg_dir:-$PWD}"
  $dvd_only  && dvd_dir="${dvd_dir:-$PWD}"
  $iso_only  && iso_dir="${iso_dir:-$PWD}"

  $quiet   && exec 1>/dev/null
  $verbose && exec 2>/dev/stdout

  if $ionice && ! which ionice &>/dev/null; then
    ionice=false
  fi
} # }}}

export VIDEO_FORMAT=NTSC

requirements       # check that we have all required apps
set_defaults       # set sane defaults
parse_options "$@" # parse commandline arguments
validate_options   # validate everything
make_clean         # clear temp directory
get_dvd_info       # get info about the dvd
make_mpeg          # encode an mpeg file
author_dvd         # author a DVD structure
build_iso          # make an iso
burn_iso           # burn an iso
cleanup            # cleanup
