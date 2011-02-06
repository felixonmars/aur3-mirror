#!/bin/bash
. /etc/rc.conf
. /etc/rc.d/functions
case "$1" in
 start)
	if [ "${msg_lang}" = "cn" ]; then
		stat_busy "正在启动 OSS 开源驱动"
	else
		stat_busy "Starting OSS/Open source driver"
	fi
   # start
   /usr/sbin/soundon
   if [ $? -gt 0 ]; then
     stat_fail
   else
     grep '^softoss' /proc/modules >/dev/null 2>/dev/null
#      if [ $? -eq 0 ]; then
#        stat_busy "Replacing old \"softoss\" module with \"vmix\""
#        rmmod softoss
#        modprobe vmix
#        sed -i 's/^softoss.*$/vmix/' /usr/lib/oss/etc/installed_drivers
#      fi
     add_daemon oss4
     stat_done
   fi
   ;;
 stop)
   if [ "${msg_lang}" = "cn" ]; then
   	stat_busy "正在保存 OSS 设置"
   else
   	stat_busy "Saving OSS mixer"
   fi
   /usr/sbin/savemixer
   if [ $? -gt 0 ]; then
     stat_fail
   else
     stat_done
   fi
   grep '^"cuckoo"' /proc/modules >/dev/null 2>/dev/null
   if [ $? -eq 0 ]; then
     stat_busy "Removing \"cuckoo\" module"
     rmmod \"cuckoo\"
   fi
   if [ "${msg_lang}" = "cn" ]; then
   	stat_busy "正在关闭 OSS 开源驱动"
   else
   	stat_busy "Stopping OSS/Open source driver"
   fi
   /usr/sbin/soundoff
   if [ $? -gt 0 ]; then
     stat_fail
   else
     rm_daemon oss4
     stat_done
   fi
   ;;
 restart)
   $0 stop
   sleep 1
   $0 start
   ;;
 *)
   echo "usage: $0 {start|stop|restart}"
esac
