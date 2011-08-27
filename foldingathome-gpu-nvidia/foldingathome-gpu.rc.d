#!/bin/bash
#/etc/rc.d/foldingathome-gpu
#
# Starts the Folding@Home-GPU client in the background

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/foldingathome-gpu

PID=`pidof -o %PPID Folding@home-Win32-gpu.exe`

function pause(){
read -s -n 1 -p "Press any key to continue . . ."
echo
}

function checkconfigs(){
if [ "$FAH_GPUS" -ge 1 ]; then
 if [ -f /opt/fah-gpu/alpha/client.cfg ]; then
  echo "Client 1 is configured, ok to go."
  else
  echo "Client 1 needs to be configured!"
  pause
  cd /opt/fah-gpu/alpha
  WINEPREFIX=/opt/fah-gpu/ wine /opt/fah-gpu/Folding@home-Win32-gpu.exe -configonly $GPU_TYPE
 fi
fi
if [ "$FAH_GPUS" -ge 2 ]; then
 if [ -f /opt/fah-gpu/bravo/client.cfg ]; then
  echo "Client 2 is configured, ok to go."
  else
  echo "Client 2 needs to be configured!"
  echo "Copying client.cfg from client 1"
  cp /opt/fah-gpu/alpha/client.cfg /opt/fah-gpu/bravo/
  cd /opt/fah-gpu/bravo && cat client.cfg | sed "s/machineid=2/machineid=3/g" > client.cfg
 fi
fi
  if [ "$FAH_GPUS" -ge 3 ]; then
   if [ -f /opt/fah-gpu/charlie/client.cfg ]; then
    echo "Client 3 is configured, ok to go."
    else
     echo "Client 3 needs to be configured!"
     echo "Copying client.cfg from client 1"
     cp /opt/fah-gpu/alpha/client.cfg /opt/fah-gpu/charlie/
     cd /opt/fah-gpu/charlie && cat client.cfg | sed "s/machineid=2/machineid=4/g" > client.cfg
   fi
  fi
    if [ "$FAH_GPUS" -ge 4 ]; then
     if [ -f /opt/fah-gpu/delta/client.cfg ]; then
      echo "Client 4 is configured, ok to go."
      else
      echo "Client 4 needs to be configured!"
      echo "Copying client.cfg from client 1"
      cp /opt/fah-gpu/alpha/client.cfg /opt/fah-gpu/delta/
      cd /opt/fah-gpu/delta && cat client.cfg | sed "s/machineid=2/machineid=5/g" > client.cfg
     fi
    fi
      if [ "$FAH_GPUS" -ge 5 ];then
       if [ -f /opt/fah-gpu/echo/client.cfg ]; then
        echo "Client 5 is configured, ok to go."
        else
        echo "Client 5 needs to be configured!"
        echo "Copying client.cfg from client 1"
        cp /opt/fah-gpu/alpha/client.cfg /opt/fah-gpu/echo/
        cd /opt/fah-gpu/echo && cat client.cfg | sed "s/machineid=2/machineid=6/g" > client.cfg
       fi
      fi
        if [ "$FAH_GPUS" -ge 6 ];then
         if [ -f /opt/fah-gpu/foxtrot/client.cfg ]; then
          echo "Client 6 is configured, ok to go."
          else
          echo "Client 6 needs to be configured!"
          echo "Copying client.cfg from client 1"
          cp /opt/fah-gpu/alpha/client.cfg /opt/fah-gpu/foxtrot/
          cd /opt/fah-gpu/foxtrot && cat client.cfg | sed "s/machineid=2/machineid=7/g" > client.cfg
         fi
        fi
          if [ "$FAH_GPUS" -ge 7 ];then
           if [ -f /opt/fah-gpu/golf/client.cfg ]; then
            echo "Client 7 is configured, ok to go."
            else
            echo "Client 7 needs to be configured!"
            echo "Copying client.cfg from client 1"
            cp /opt/fah-gpu/alpha/client.cfg /opt/fah-gpu/golf/
            cd /opt/fah-gpu/golf && cat client.cfg | sed "s/machineid=2/machineid=8/g" > client.cfg
           fi
          fi
            if [ "$FAH_GPUS" -ge 8 ];then
             if [ -f /opt/fah-gpu/hotel/client.cfg ]; then
              echo "Client 8 is configured, ok to go."
              else
              echo "Client 8 needs to be configured!"
              echo "Copying client.cfg from client 1"
              cp /opt/fah-gpu/alpha/client.cfg /opt/fah-gpu/hotel/
              cd /opt/fah-gpu/hotel && cat client.cfg | sed "s/machineid=2/machineid=9/g" > client.cfg
             fi
            fi
             if [ "$FAH_GPUS" -ge 9 ]; then
              echo "You have too many GPUs set!"
             fi
}

function runem(){
if [ "$FAH_GPUS" -ge 1 ]; then
 cd /opt/fah-gpu/alpha
 WINEPREFIX=/opt/fah-gpu/ wine /opt/fah-gpu/Folding@home-Win32-gpu.exe $GPU_TYPE -gpu 0 $FAH_CLIENT_FLAGS >> /dev/null 2>&1 &
 sleep 1
fi
if [ "$FAH_GPUS" -ge 2 ]; then
 cd /opt/fah-gpu/bravo
 WINEPREFIX=/opt/fah-gpu/ wine /opt/fah-gpu/Folding@home-Win32-gpu.exe $GPU_TYPE -gpu 1 $FAH_CLIENT_FLAGS >> /dev/null 2>&1 &
 sleep 1
fi
if [ "$FAH_GPUS" -ge 3 ]; then
 cd /opt/fah-gpu/charlie
 WINEPREFIX=/opt/fah-gpu/ wine /opt/fah-gpu/Folding@home-Win32-gpu.exe $GPU_TYPE -gpu 2 $FAH_CLIENT_FLAGS >> /dev/null 2>&1 &
 sleep 1
fi
if [ "$FAH_GPUS" -ge 4 ]; then
 cd /opt/fah-gpu/delta
 WINEPREFIX=/opt/fah-gpu/ wine /opt/fah-gpu/Folding@home-Win32-gpu.exe $GPU_TYPE -gpu 3 $FAH_CLIENT_FLAGS >> /dev/null 2>&1 &
 sleep 1
fi
if [ "$FAH_GPUS" -ge 5 ]; then
 cd /opt/fah-gpu/echo
 WINEPREFIX=/opt/fah-gpu/ wine /opt/fah-gpu/Folding@home-Win32-gpu.exe $GPU_TYPE -gpu 4 $FAH_CLIENT_FLAGS >> /dev/null 2>&1 &
 sleep 1
fi
if [ "$FAH_GPUS" -ge 6 ]; then
 cd /opt/fah-gpu/foxtrot
 WINEPREFIX=/opt/fah-gpu/ wine /opt/fah-gpu/Folding@home-Win32-gpu.exe $GPU_TYPE -gpu 5 $FAH_CLIENT_FLAGS >> /dev/null 2>&1 &
 sleep 1
fi
if [ "$FAH_GPUS" -ge 7 ]; then
 cd /opt/fah-gpu/golf
 WINEPREFIX=/opt/fah-gpu/ wine /opt/fah-gpu/Folding@home-Win32-gpu.exe $GPU_TYPE -gpu 6 $FAH_CLIENT_FLAGS >> /dev/null 2>&1 &
 sleep 1
fi
if [ "$FAH_GPUS" -ge 8 ]; then
 cd /opt/fah-gpu/hotel
 WINEPREFIX=/opt/fah-gpu/ wine /opt/fah-gpu/Folding@home-Win32-gpu.exe $GPU_TYPE -gpu 7 $FAH_CLIENT_FLAGS >> /dev/null 2>&1 &
 sleep 1
fi
}

case "$1" in
    start)
    stat_busy "Starting Folding@Home-GPU"
    if [ -z "$PID" ]; then
     if [ -d /opt/fah-gpu/drive_c ]; then
      checkconfigs
      runem
      else
      echo "WinePrefix non-existent, creating WinePrefix"
      pause
      cd /opt/fah-gpu
      WINEPREFIX=/opt/fah-gpu wineboot
      echo "WinePrefix has been created, restarting daemon."
      pause
      /etc/rc.d/foldingathome-gpu start
     fi
    fi

    if [ ! -z "$PID" -o $? -gt 0 ]; then
        stat_fail  
    else
        add_daemon foldingathome-gpu
        stat_done

    fi
    ;;
    
    stop)
    stat_busy "Stopping Folding@Home-GPU"
    [ ! -z "$PID" ]&& WINEPREFIX=/opt/fah-gpu wineserver -k &> /dev/null
    if [ $? -gt 0 ]; then
        stat_fail
    else
        rm_daemon foldingathome-gpu
        stat_done
    fi
    ;;
    
    restart)
    $0 stop
    sleep 1
    $0 start
    ;;
    
    *)
    echo $"Usage: $0 {start|stop|restart}"
esac
