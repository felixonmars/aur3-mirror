#!/bin/bash
case ${1} in
  hibernate|suspend)
    echo "e823fix: Nothing to do"
    ;;
  thaw|resume)
    echo "e823fix: Restarting service..."
    /usr/sbin/e823fix_wrapper
    ;;
  *)
    echo "e823fix: Just what do you think you're doing?? :D"
    ;;
esac
