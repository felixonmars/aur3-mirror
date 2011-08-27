#!/bin/bash
#####################################################################
#
# Startup script for BCEL Verifier
#
#####################################################################


BCEL_JAR="/usr/share/java/bcel.jar"

function usage()
{
  echo "BCELVerifier (JustIce) v.5.2"
  echo "This tool is a part of BCEL library"
  echo
  echo "Usage: bcelverifier [options] fully_qualified_class_name"
  echo
  echo "Options:"
  echo "    -cp PATHS   - append paths to java classpath"
  echo
  
  exit 1
}

if [[ -z "$@" ]]; then
  usage
fi

class=
classpath=

while [[ -n "$1" ]]; do
  case "$1" in
    -cp)
      shift
      classpath="$classpath:$1"
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

"$JAVA_HOME/bin/java" org.apache.bcel.verifier.Verifier "$class"



