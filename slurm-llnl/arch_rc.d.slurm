#!/bin/bash
#
# description: SLURM is a simple resource management system which \
#              manages exclusive access to a set of compute \
#              resources and distributes work to those resources.
#
# processname: /usr/sbin/slurmd
# pidfile: /run/slurmd.pid
#
# processname: /usr/sbin/slurmctld
# pidfile: /run/slurmctld.pid
#
# config: /etc/slurm
#

BINDIR=/usr/bin
CONFDIR=/etc/slurm
LIBDIR=/usr/lib
SBINDIR=/usr/sbin

# Source main config
if [ ! -f /etc/rc.conf ]; then
  echo "Could not find /etc/rc.conf. Are we using ARCH linux?"
  exit 1
fi
. /etc/rc.conf

# Source function library.
if [ ! -f /etc/rc.d/functions ]; then
  echo "Could not find /etc/rc.d/functions. Is some other daemon launch mechanism used?"
  exit 1
fi
. /etc/rc.d/functions

STARTPROC=daemon

function rc_status() {
  RETVAL=$?
}
function rc_exit () {
  exit $RETVAL
}
RETVAL=0


if [ ! -x $BINDIR/scontrol ]; then
  echo "Could not find $BINDIR/scontrol. Bad path?"
  exit 1
fi

# Source slurm specific configuration
# SLURMCTLD_OPTIONS defines slurmctld command line options. See "man slurmctld"
# SLURMD_OPTIONS defines slurmd command line options. See "man slurmd"
if [ -f /etc/default/slurm ] ; then
  . /etc/default/slurm
else
  SLURMCTLD_OPTIONS=""
  SLURMD_OPTIONS=""
fi

if [ ! -f $CONFDIR/slurm.conf ]; then
  echo "Could not find $CONFDIR/slurm.conf. Bad path?"
  exit 1
fi

# setup library paths for slurm and munge support
export LD_LIBRARY_PATH=$LIBDIR${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}

start() {
  prog=$1
  shift
  stat_busy "Starting $prog"
  unset HOME MAIL USER USERNAME
  $SBINDIR/$prog $*
  if [ $? -gt 0 ]; then
    stat_fail
  else
    add_daemon $prog
    stat_done
  fi
}

stop() {
  prog=$1
  stat_busy "Stopping $prog"
  PID=`pidof -o %PPID $prog`
  [ "$PID" ] && kill $PID &> /dev/null
  if [ $? -gt 0 ]; then
    stat_fail
  else
    rm_daemon $prog
    stat_done
  fi
}

startall() {
  for prog in `$BINDIR/scontrol show daemons`; do
    optvar=`echo ${prog}_OPTIONS | tr "a-z" "A-Z"`
    start $prog ${!optvar}
  done
}

#
# status() with slight modifications to take into account
# instantiations of job manager slurmd's, which should not be
# counted as "running"
#
slurmstatus() {
  local base=${1##*/}
  local pid
  local rpid
  local pidfile

  pidfile=`grep -i ${base}pid $CONFDIR/slurm.conf | grep -v '^ *#'`
  if [ $? = 0 ]; then
    pidfile=${pidfile##*=}
    pidfile=${pidfile%#*}
  else
    pidfile=/run/${base}.pid
  fi

  pid=`pidof -o $$ -o $$PPID -o %PPID -x $1 || \
  pidof -o $$ -o $$PPID -o %PPID -x ${base}`

  if [ -f $pidfile ]; then
    read rpid < $pidfile
    if [ "$rpid" != "" -a "$pid" != "" ]; then
      for i in $pid ; do
        if [ "$i" = "$rpid" ]; then
          echo $"${base} (pid $pid) is running..."
          return 0
        fi
      done
    elif [ "$rpid" != "" -a "$pid" = "" ]; then
      #           Due to change in user id, pid file may persist
      #           after slurmctld terminates
      if [ "$base" != "slurmctld" ] ; then
        echo $"${base} dead but pid file exists"
      else
        echo $"${base} is stopped"
      fi
      return 1
    fi

  fi

  if [ "$base" = "slurmctld" -a "$pid" != "" ] ; then
    echo $"${base} (pid $pid) is running..."
    return 0
  fi

  echo $"${base} is stopped"

  return 3
}

#
# stop slurm daemons,
# wait for termination to complete (up to 10 seconds) before returning
#
slurmstop() {
  for prog in `$BINDIR/scontrol show daemons`; do
    stop $prog

    for i in 1 2 3 4
    do
      sleep $i
      slurmstatus $prog
      if [ $? != 0 ]; then
        break
      fi
    done
  done
}

#
# The pathname substitution in daemon command assumes prefix and
# exec_prefix are same.  This is the default, unless the user requests
# otherwise.
#
# Any node can be a slurm controller and/or server.
#
case "$1" in
  start)
  startall
  ;;
  startclean)
  SLURMCTLD_OPTIONS="-c $SLURMCTLD_OPTIONS"
  SLURMD_OPTIONS="-c $SLURMD_OPTIONS"
  startall
  ;;
  stop)
  slurmstop
  ;;
  status)
  for prog in `$BINDIR/scontrol show daemons`; do
    slurmstatus $prog
  done
  ;;
  restart)
  $0 stop
  $0 start
  ;;
  condrestart)
  if [ -f /var/lock/subsys/slurm ]; then
    for prog in `$BINDIR/scontrol show daemons`; do
      stop $prog
      start $prog
    done
  fi
  ;;
  reconfig)
  for prog in `$BINDIR/scontrol show daemons`; do
    killproc $prog -HUP
  done
  ;;
  test)
  for prog in `$BINDIR/scontrol show daemons`; do
    echo "$prog runs here"
  done
  ;;
  *)
  echo "Usage: $0 {start|startclean|stop|status|restart|reconfig|condrestart|test}"
  exit 1
  ;;
esac

rc_exit
