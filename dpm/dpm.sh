#!/bin/sh
ACTION=`printf "Sleep\nHibernate" | dmenu -i $*`
if [ "$ACTION" == 'Sleep' ]; then
  sudo pm-suspend
fi
if [ "$ACTION" == 'Hibernate' ]; then
  sudo pm-hibernate
fi
