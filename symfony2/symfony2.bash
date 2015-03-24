_symfony()
{            
  local cur prev action namespace command task
  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}
  command=${COMP_WORDS[0]}
  namespace=${COMP_WORDS[1]}
  task=${COMP_WORDS[3]}
  count=${#COMP_WORDS[@]}
  [[ $count -gt 2 ]] && befprev=${COMP_WORDS[COMP_CWORD-2]}
  if [[ x$namespace == 'xhelp' ]]; then
    namespace=${COMP_WORDS[2]};
    task=${COMP_WORDS[4]};
    count=$(($count-1));
  fi

  CACHEFILE="$(dirname $(which $command))/cache/tasks.cpl";

  # we create a cache file in the cache directory if none exists
  # and update it if it's not from today
  #
  # you will need to manually delete this cache file
  # if you want to reflect more recent changes to the tasks

  if [[ ! -f "$CACHEFILE" ]] || [[ "$(date -d "$(stat -c %y $CACHEFILE)" +%W)" != "$(date +%W)" ]]; then
    ${COMP_WORDS[0]} | perl -ne 'if ( /^Available/ ) { $first = ""; } elsif ( /^([a-zA-Z0-9\-]+)/ ) { $first = $1; } elsif ( /^\s*:([a-zA-Z0-9\-]+)/ ) { print $first . (($first) ? ":" : "").$1 . "\n"; }' > $CACHEFILE
  fi

  case $count in
    1|2)
      # 2 completion words - we are looking for a namespace

      OLD_IFS=$IFS
      IFS=$'\n'
      COMPREPLY=( $( compgen -W "$(cat $CACHEFILE | cut -d ' ' -f 1)" -- $cur ) )
      IFS=$OLD_IFS
    ;;    

    3|4)
      # 3 or 4 completion words - we are looking for a task
      # within the current namespace
      # (bash treats the colon as a new completion word)

      case $prev in
        'list')
        ;;
        'help')
          OLD_IFS=$IFS
          IFS=$'\n'
          COMPREPLY=( $( compgen -W "$(cat $CACHEFILE | cut -d ' ' -f 1)" -- $cur ) )
          IFS=$OLD_IFS
        ;;
        *)
          COMPREPLY=( $( compgen -W "$(
            for line in $(cat $CACHEFILE); do
              TASK=${line##*:};
              [[ x${line%":$TASK"} == x$namespace ]] && echo $TASK
            done
          )" -- ${cur#":"} ) )
        ;;
      esac
    ;;

    *)
      # 5 or more completion words
      # if in help mode, bail out
      # if previous is '=' set previous to the one before
      # if we have a well known option, try to suggest possible values
      # otherwise, parse usage string to suggest available options

      if [[ x${COMP_WORDS[1]} == x'help' ]]; then
        compopt -o nospace;
      else
        [[ x$prev == 'x=' ]] && prev=$befprev;
        case $prev in
          '--env')
            COMPREPLY=( $( compgen -W "dev prod qa test" -- ${cur#'='} ) );
          ;;
          '--application')
            COMPREPLY=( $( compgen -W "$(
              for app in $(ls $(dirname $(which $command))/apps); do
                echo $app ;
              done
            )" -- ${cur#'='} ) );
          ;;
	  '--connection')
	    COMPREPLY=( $( compgen -W "$(
              for c in $(cat config/databases.yml | grep -i "^  [a-z0-9]\+:" | uniq); do
	        echo ${c:0: -1}
	      done
            )" -- ${cur#'='} ) )
	  ;;
          *)
	    TASK="${COMP_WORDS[1]}:${COMP_WORDS[3]}"
	    line="$(cat $CACHEFILE | grep $TASK)"
	    if [[ -z $line ]]; then
	      line = $TASK
	      (cat $CACHEFILE; echo $line) > $CACHEFILE
            fi
            args="${line#$TASK}"
	    if [[ -z $args ]]; then
              args="$(
                for line in $($command help $namespace:$task); do
                  [[ ${line} == 'Arguments:' ]] && break;
                  if [[ ${line} != 'Usage:' ]]; then
                    line=${line#'symfony'};
                    line=${line#"$namespace:$task"};
                    echo -n "$line " | sed 's/[][\.]//g'
                  fi
                done
              )"
              sed -i -e "s/$TASK/$TASK $args/" $CACHEFILE
	    fi
	    COMPREPLY=( $( compgen -W "$args" -- $cur ) )
	    if [[ ${#COMPREPLY[@]} -gt 0 ]]; then
              [[ "${COMPREPLY[0]: -1:1}" == '=' ]] && compopt -o nospace;
	    else
	      COMPREPLY=( $( compgen -f -- ${cur#'='} ) )
	      compopt -o filenames
	    fi
          ;;
        esac
      fi
    ;;
  esac

  return 0
}

complete -F _symfony symfony

