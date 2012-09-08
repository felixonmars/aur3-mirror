#!/usr/bin/env bash
set -e
#set -x
# Locate the service in the user's $SVDIR or /etc/sv
function find_service {
  service=$1
  svdir=$(svdir 2>/dev/null)
  if [ "x$service" != "x" ];then
    if [ -L "$svdir/$service" ];then
      location=$(readlink -f "$svdir/$service")
    fi
  fi
  if [ "x$location" != "x" ];then
    echo $location
  else
    if [ -d "$svdir/../sv/$service" ];then
      echo "$svdir/../sv/$service"
    elif [ -d "$svdir/../Service/$service" ];then
      echo "$svdir/../Service/$service"
    elif [ -d "$svdir/../Services/$service" ];then
      echo "$svdir/../Services/$service"
    elif  [ "$svdir" != "/etc/sv/$service" -a -d "/etc/sv/$service" ];then
      echo "/etc/sv/$service"
    fi
  fi
}

# Set to user's $SVDIR or /service
function svdir {
  if [ -z $SVDIR ];then
    #echo "using /service" >&2
    if [ -d /service ];then
      svdir=/service
    elif [ -d /etc/service ];then
      svdir=/etc/service
    elif [ -d /var/service ];then
      svdir=/var/service
    else
      echo "No service directory found" 1>&2
      exit 127
    fi
  else
    #echo "using $SVDIR" >&2
    if [ -d "$SVDIR" ];then
      svdir=$SVDIR
    else
      echo "No service directory found" 1>&2
      exit 127
    fi
  fi
  echo $svdir
}

# Add sudo if we don't own the directory in question
function check_owner {
  lndir=$1
  if [ ! -w $lndir ];then
    echo "sudo "
  fi
}

# Symlink a service (from find_service's path to `svdir`/$service)
function enable {
  echo "Enabling $1" >&2
  service=$1
  svdir=$(find_service $service)
  if [ -z "$svdir" -o ! -d "$svdir" ];then
    echo "No such service '$service'" >&2
    exit 1
  fi
  ln_dir=$(svdir)
  if [ -L "$ln_dir/$service" ];then
    echo "Service already enabled!" >&2
    echo "  $(sv s $ln_dir/$service)" >&2
    exit 1
  fi
  $(check_owner $ln_dir) ln -s $svdir $ln_dir
}

# Remove a symlink of a service (from find_service's path to `svdir`/$service)
function disable {
  echo "Disabling $1" >&2
  service=$1
  ln_dir=$(svdir)
  if [ ! -L "$ln_dir/$service" ];then
    echo "Service not enabled!" >&2
    exit 1
  fi
  $(check_owner $ln_dir) rm $ln_dir/$service
}

# Generic list, of one service or all
function list {
  svdir=$(svdir)
  if [ ! -z "$1" ];then
    $(check_owner $svdir) sv s "$svdir/"$1
  else
    echo "Listing All Services"
    $(check_owner $svdir) sv s "$svdir/"*
  fi
}

# Usage
function usage {
  cmd=$1
  case "$cmd" in
    sv-enable) echo "sv-enable <service> - Enable a service and start it (will restart on boots)";;
    sv-disable) echo "sv-disable <service> - Disable a service from starting (also stop the service)";;
    sv-stop) echo "sv-stop <service> - Stop a service (will come back on reboot)";;
    sv-start) echo "sv-start <service> - Start a stopped service";;
    sv-restart) echo "sv-restart <service> - Restart a running service";;
    svls) echo "svls [<service>] - Show list of services (Default: all services, pass a service name to see just one)";;
    sv-find) echo "sv-find <service> - Find a service, if it exists";;
    sv-list) echo "sv-list - List available services";;
    *) echo "Invalid command (sv-list svls sv-find sv-enable sv-disable sv-stop sv-restart sv-start sv-stop)";;
  esac
}

# Start main program

cmd=$(basename $0) # Get the command
if [ "$cmd" == "sv-helper" -o "$cmd" == "sv-helper.sh" ];then
  cmd=$1
  shift
fi
# help
while getopts h options
do
  case $options in
    h) echo $(usage $cmd)
       exit;;
  esac
done

case "$cmd" in
  enable|sv-enable) enable $@;;
  disable|sv-disable) disable $@;;
  start|sv-start) sv u $(find_service $@);;
  restart|sv-restart) sv t $(find_service $@);;
  stop|sv-stop) sv d $(find_service $@);;
  ls|svls) list $@;;
  find|sv-find) find_service $@;;
  list|sv-list) find $(find_service) -maxdepth 1 -mindepth 1 -type d -exec basename {} \; ;;
  *) usage;
     break;;
esac

