# switch PATH to new JAVA_HOME

path_remove() {
 # remove element from colon separated list
 # usage: path_remove <pathvar> <pathelement>
 eval path_removeP="\"\$$1\""
 path_removeP=`(NP= S= IFS=: ; for P in $path_removeP; do [ "$P" = "$2" ] && continue; NP="$NP$S$P"; S=':'; done; echo "$NP")`
 eval $1='"$path_removeP"'
 eval [ "\"\$$1\"" ] || unset "$1"
}

path_remove PATH "/opt/java/jre/bin"
path_remove PATH "/opt/java/bin"
path_remove PATH "/opt/java5/jre/bin"
path_remove PATH "/opt/java5/bin"

if [ "$JAVA_HOME" ]; then
  path_remove PATH "$JAVA_HOME/bin"
  path_remove PATH "$JAVA_HOME/jre/bin"
  PATH=$JAVA_HOME/jre/bin:$PATH

  [ -f "$JAVA_HOME/bin/java" ] || JAVA_HOME=$JAVA_HOME/jre # if jdk not installed
fi

export JAVA_HOME

unset -f path_remove

