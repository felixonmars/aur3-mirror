#!/bin/bash
#########################################
## Control script for conkyclockwidget ##
## by jpope                            ##
## v 1.0.2010.10.19                    ##
## Modified my OvsInc                  ##
#########################################
cnfg1="/usr/share/conky/clockwidget/conkyclockwdgtrc"
cnfg1btn="/usr/share/conky/clockwidget/btnclockwdgt.py"
confdir="${HOME}/.conky/clockwidget"
conf="${confdir}/clockswitch"
main="/usr/share/conky/conky_main/conkyrc_main"

conky-start()
{
            if [[ $(pgrep -f "${main}") ]]; then
        	echo "Conky main window is already running. Use $0 restart"
    	    else
    		conky -q -c "${main}"
    	    fi
            
        if [[ $(pgrep -f "${cnfg1}") ]]; then
                echo "Conky clock widget is already running. Use $0 restart"
        else
            [[ -r ${cnfg1}  ]] && \
             (sleep 1s
              mkdir -p "${confdir}"  2>/dev/null 
               echo "0" > "${conf}"
                conky -q -c "${cnfg1}") &
            [[ -r ${cnfg1btn} ]] &&  /usr/bin/python2 "${cnfg1btn}" &
        fi
}

conky-stop()
{
            pkill -f clockwdgt && echo "Clockwidget stopped" || echo "Clockwidget is not running"
            pkill -f conky_main && echo "Conkymain stopped" || echo "Conkymain is not running"
}

    case $1 in
        stop )
		conky-stop;;
        start )
		conky-start;;
        restart )
		conky-stop
		sleep .5
		conky-start
            ;;
        * )
            echo 'usage ( start | stop | restart )'
            ;;
    esac
exit
