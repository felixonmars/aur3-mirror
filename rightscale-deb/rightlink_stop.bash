#!/bin/bash

. /opt/rightscale/etc/init.d/rightscale_functions

logger -t RightScale "RightLink Service stop."
check_invoking_user_permissions
check_for_rightscale
configure_proxy
case `runlevel | cut -d ' ' -f 2` in 
  0|6) 
    decommission_right_link_agent 
  ;; 
  *) 
    echo "Current runlevel is not 0 or 6; skipping decommission."
    echo "To force decommission, run this script with 'decommission' instead of 'stop'."
  ;;
esac
stop_right_link_agent