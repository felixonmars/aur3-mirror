# switch PATH to new M2_HOME

path_remove() {
 # remove element from colon separated list
 # usage: path_remove <pathvar> <pathelement>
 eval path_removeP="\"\$$1\""
 path_removeP=`(NP= S= IFS=: ; for P in $path_removeP; do [ "$P" = "$2" ] && continue; NP="$NP$S$P"; S=':'; done; echo "$NP")`
 eval $1='"$path_removeP"'
 eval [ "\"\$$1\"" ] || unset "$1"
}

export M2_HOME

path_remove PATH "/opt/maven/bin"
path_remove PATH "/opt/maven2/bin"
if [ "$M2_HOME" ]; then
  path_remove PATH "$M2_HOME/bin"
  export PATH=$M2_HOME/bin:$PATH
fi

unset -f path_remove

