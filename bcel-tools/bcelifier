#!/bin/bash
#####################################################################
#
# Startup script for BCELifier
#
#####################################################################


BCEL_JAR="/usr/share/java/bcel.jar"

function usage()
{
  echo "BCELifier v. 5.2"
  echo "This tool is a part of BCEL library"
  echo
  echo "Usage: bcelifier [options] fully_qualified_class_name"
  echo
  echo "Options:"
  echo "    -cp PATHS   - append paths to java classpath"
  echo "    -o  FILE    - output file name (default: -)"
  echo
  
  exit 1
}

if [[ -z "$@" ]]; then
  usage
fi

class=
classpath=
output=

while [[ -n "$1" ]]; do
  case "$1" in
    -cp)
      shift
      classpath="$classpath:$1"
      ;;

    -o)
      shift
      output="$1"
      ;;    
      
    
    -*)
      usage
      ;;

    *)
      if [[ -n "$class" ]]; then
        usage
      fi
      class="$1"
      ;;
  esac
  shift
done

if [[ -z "$class" ]]; then
  usage
fi


export CLASSPATH="$BCEL_JAR:$(pwd)$classpath"

if [[ -z "$output" || "$output" == "-" ]]; then
  "$JAVA_HOME/bin/java" org.apache.bcel.util.BCELifier "$class"
else
  "$JAVA_HOME/bin/java" org.apache.bcel.util.BCELifier "$class" > "$output"
fi



