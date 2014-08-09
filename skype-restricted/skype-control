#!/bin/bash

print_usage () {
  echo "Usage:"
  echo "    skype-control [OPTIONS...] - Control of the restricted skype"
  echo ""
  echo "Options :"
  echo "  -h, --help          Print this message."
  echo "  -k, --kill-all      Will try to kill any process belonging to the restricted skype user."
  echo "  --leave-xhost       Remove skype user from access control list"
  exit 0
}


kill_all () {
    echo "Killing skype user's processes..."
    for pid in `ps -e -o user,pid | grep ^_skype | gawk '{ print $2 }'`; do
	sudo kill ${pid}
    done
    sleep 1
    ps_count=`ps -e -o user,pid | grep -c ^_skype`
    if [[ $ps_count > 0 ]]; then
	echo "There are some remaining processes - trying again..."
	for pid in `ps -e -o user,pid | grep ^_skype | gawk '{ print $2 }'`; do
	    sudo kill ${pid}
	done
    fi
    ps_count=`ps -e -o user,pid | grep -c ^_skype`
    if [[ $ps_count > 0 ]]; then
	echo "Fail: There are still some remaining processes."
    else
	echo "Done."
    fi
}

leave_xhost () {
  xhost -SI:localuser:_skype 1>/dev/null
  if [[ $? == 0 ]]; then
      echo "Skype user has been removed from access control list."
  else
      echo "ERROR: Failed to remove _skype from access control list."
      exit 127
  fi
}


if [[ ${1} == "" ]] ; then
   print_usage
fi

if [[ ${1} == "-h" || ${1} == "--help" ]] ; then
   print_usage
fi

if [[ ${1} == "-k" || ${1} == "--kill-all" ]] ; then
   kill_all
elif  [[ ${1} == "--leave-xhost" ]] ; then
   leave_xhost
else
   echo "Unknown option: '${1}'"
fi
