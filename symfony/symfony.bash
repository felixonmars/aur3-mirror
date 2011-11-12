_symfony()
{            
  local cur prev action
  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}
  action=${COMP_WORDS[1]}

  case "$prev" in
    "init-module"|"propel-generate-crud"|"propel-init-crud"|"propel-init-admin"|"generate:module"|"propel:generate-crud"|"propel:init-admin")
      COMPREPLY=( $( compgen -W "$( ls -1 apps 2>/dev/null | sed -e 's/ /\\ /g' | sed -e 's/\/$//g' )" -- $cur ) )

      return 0
    ;;

    "init-project"|"generate:project")
      COMPREPLY=( $( compgen -W "$( pwd | perl -pe "s/^.*?([^\/]+)$/\$1/g" )" -- $cur ) )

      return 0
    ;;

    "init-app"|"generate:app")
      COMPREPLY=( $( compgen -W "frontend backend" -- $cur ) )

      return 0
    ;;    

    "sync")
      if (($COMP_CWORD == 3)); then
        COMPREPLY=( $( compgen -W 'go' -- $cur))
      fi

      return 0
    ;;

    *symfony)
      SYMFONY_VERSION=$( $prev -V | sed 's/^symfony version //g' | awk -F '.' '{print $1 "." $2;}' )

      case "$SYMFONY_VERSION" in
        0.*)
          # Versions less than 1.0 are not supported.
          COMPREPLY=()
        ;;

        "1.0")
          COMPREPLY=( $( compgen -W "$( $prev -T | awk '/^  /' | cut -d ' ' -f 3 )" -- $cur ) )
        ;;

        *)
          COMPREPLY=( $( compgen -W "$( 
NAMESPACE=''
OLD_IFS=$IFS

IFS=$'\n'
for line in $( $prev -T ); do
  if [ $line != 'Available tasks:' ]; then
    if [ ${line:0:2} == '  ' ]; then
      TASK=$(echo $line | awk -F ':' '{print $2;}' | cut -d ' ' -f 1)
      if [ -z $NAMESPACE ]; then
        echo $TASK
      else
        echo $NAMESPACE:$TASK
      fi
    else
      NAMESPACE=$line
    fi
  fi
done

IFS=$OLD_IFS
)" -- $cur ) )

          # Work-around bash_completion issue where bash interprets a colon as a separator.
          # Work-around borrowed from the darcs work-around for the same issue.
          local colonprefixes=${cur%"${cur##*:}"}
          local i=${#COMPREPLY[*]}
          while [ $((--i)) -ge 0 ]; do
            COMPREPLY[$i]=${COMPREPLY[$i]#"$colonprefixes"} 
          done
        ;;
      esac

      return 0
    ;;    

    *)
      case "$action" in
        "propel-generate-crud"|"propel-init-crud"|"propel-init-admin"|"propel:generate-crud"|"propel:init-admin")
          if (($COMP_CWORD == 3)); then
            COMPREPLY=( $( compgen -W "$( find lib/model -maxdepth 1 -name '*.php' -exec basename '{}' '.php' ';' | grep -v 'Peer$' | tr [:upper:] [:lower:] )" -- $cur ) )
          elif (($COMP_CWORD == 4)); then
            COMPREPLY=( $( compgen -W "$( find lib/model -maxdepth 1 -name '*.php' -exec basename '{}' '.php' ';' | grep -v 'Peer$' )" -- $cur ) )
          fi

          return 0
        ;;
      esac

      return 0
    ;;
  esac

  return 0  
}

complete -F _symfony symfony
