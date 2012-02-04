#!/bin/bash
#
# v0.3 (10 07 2005)
#

# general config
. /etc/rc.conf
. /etc/rc.d/functions


kdmrc="/opt/kde/share/config/kdm/kdmrc"

function change_layout() {
    CurrentKdmrcLine=`grep -i ServerArgsLocal $kdmrc`
    WantedKdmrcLine="ServerArgsLocal=-layout $1"
    sed -i "1,1000 s|$CurrentKdmrcLine|$WantedKdmrcLine|" $kdmrc
}


case "$1" in
  start)

    defaultlayout="nv"
    cmdline=`sed 's/.*xlayout=//; s/ .*//' /proc/cmdline`
 
    if [ "`echo $cmdline | grep -i \"=\"`" == "" ]; then
	    layout=$cmdline
    else
	    stat_busy "Kernel parameter \"xlayout\" not set, setting it to \"${C_OTHER}$defaultlayout${C_CLEAR}\""
	    layout=$defaultlayout
    fi

    stat_busy "Setting X layout \"${C_OTHER}$layout${C_CLEAR}\""

    change_layout "$layout"

    
    stat_done
    ;;
    

  layout)

    if [ $# == 2 ]; then
        stat_busy "Setting X layout \"${C_OTHER}$2${C_CLEAR}\""

        telinit 3

        change_layout "$2"
	
	telinit 5
	
        stat_done

    else
        echo "Usage : $0 layout <layout name>"
    fi
    ;;
    
  stop)
    ;;

  status)
    stat_busy "Getting current X layout"

    CurrentKdmrcLine=`grep -i ServerArgsLocal $kdmrc`
    layout=${CurrentKdmrcLine:24}
    stat_busy "Current X layout is \"${C_OTHER}${layout}${C_CLEAR}\""
    stat_done
    ;;

  *)
    echo "Usage: $0 {start|status|layout <layout name>}"
esac




