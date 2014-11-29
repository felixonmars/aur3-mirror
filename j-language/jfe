#!/bin/bash
#
# front-end for jconsole and jwd (http://www.jsoftware.com)
# written for Arch Linux by Lorenzo Tomei
#
export JPATH=/usr/lib/j
case "$1" in
  -c|--console)
    shift
    ${JPATH}/bin/jconsole "$@"
    ;;
  -w|--window)
    shift
    ${JPATH}/bin/jwd "$@"
    ;;
  -e|--external)
    shift
    ${JPATH}/bin/jee "${JPATH}/bin/jwd $@"
    ;;
  -b|--break)
    ${JPATH}/bin/jbreak
    ;;
 *)
    echo "usage: $0 {-c|--console|-w|--window|-e|--external|-b|--break} [jargs]"
    ;;
esac
