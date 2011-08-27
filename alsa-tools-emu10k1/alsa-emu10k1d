#!/bin/bash
# alsa-emu10k1d v0.5 RC1 (GPL3) by 3ED <krzysztof1987@gamil.com>
#
. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/alsa-emu10k1d


# DSP state file..
ETC_DIR="/var/lib/alsa"
DSP_STATE="${ETC_DIR}/asound.dsp"
MASTER_STATE="${ETC_DIR}/amixer.state"
ASOUND_STATE="${ETC_DIR}/asound.state"


#-------------------------------------------------------------------------------
#  Initial functions - setup and update
#-------------------------------------------------------------------------------
sub_update_to_new_version() {
  sub_update_0_4_to_0_5
}
sub_update_0_4_to_0_5() { #TODO ${ETC_DIR}
  # Now you can simple mount rootfs as read-only and this program is not the barier
  [ ! -d "/var/lib/alsa" ] && install -dm755 "/var/lib/alsa" || return

  if [ ! -f "/var/lib/alsa/asound.dsp" ] && [ -f "/etc/asound.dsp" ]; then
    install -m600 "/etc/asound.dsp" "/var/lib/alsa/asound.dsp"
  fi

  if [ ! -f "/var/lib/alsa/asound.state" ] && [ -f "/etc/asound.state" ]; then
    install -m600 "/etc/asound.state" "/var/lib/alsa/asound.state"
  fi
}
sub_first_run() {
  echo -n "Turn off any audio programs and speakers.. [enter to continue]"
  read
  /etc/rc.d/alsa stop
  echo "==> Backuping rc.conf.."
  cp -v /etc/rc.conf /etc/rc.conf.backup-emu10k1d
  echo "==> Replacing \"alsa\" --> \"alsa-emu10k1d\" in rc.conf.."
  sed -i 's/\(DAEMONS.*\)alsa[[:space:]]\(.*)\)/\1alsa-emu10k1d \2/g' /etc/rc.conf
}


#---------------------------------------------------------------------------
#  Common functions
#---------------------------------------------------------------------------
sub_stat_return() {
  if [ "$1" = "0" ]; then
    stat_done
  else
    stat_fail
    return 1
  fi
}
sub_lock_touch() {
  [ -f "/tmp/.lo10k1.lock" ] || touch /tmp/.lo10k1.lock || return 1
}


#-------------------------------------------------------------------------------
#  Storing functions
#-------------------------------------------------------------------------------
sub_store_master_mixer() {
  local OPH="`amixer get Master`" OPH_MODE=0 L="" R=""

  while read LINE; do
    # 1 channel - mono
    if [ $OPH_MODE = 1 ] && [ "${LINE:0:5}" = "Mono:" ]; then
      L="`expr "$LINE" : ".*Playback [0-9]* \[\([0-9]*%\).*"`" || return 1
    fi

    # 2 channels - stereo
    if [ $OPH_MODE = 2 ] && [ "${LINE:0:11}" = "Front Left:" ]; then
      L="`expr "$LINE" : ".*Playback [0-9]* \[\([0-9]*%\).*"`" || return 1
    fi

    if [ $OPH_MODE = 2 ] && [ "${LINE:0:12}" = "Front Right:" ]; then
      R="`expr "$LINE" : ".*Playback [0-9]* \[\([0-9]*%\).*"`" || return 1
    fi

    # detecting mixer type: mono/stereo
    if [ $OPH_MODE = 0 ] && [ "${LINE:0:18}" = "Playback channels:" ]; then
      expr "$LINE" : ".*Mono"                     &> /dev/null && OPH_MODE=1
      expr "$LINE" : ".*Front Left - Front Right" &> /dev/null && OPH_MODE=2
    fi
  done << LINE
$OPH
LINE

  [ -z "$L" ] && return 1

  echo $L $R > "$MASTER_STATE"
}
sub_store_DSP(){
  /usr/bin/lo10k1 --store "$DSP_STATE" || return 1
}
sub_store_ALSA(){
  /usr/sbin/alsactl $ALSA_ARGS --file "$ASOUND_STATE" store || return 1
}


#-------------------------------------------------------------------------------
#  Restoring functions
#-------------------------------------------------------------------------------
sub_restore_DSP() {
  test -f "/tmp/.lo10k1.lock" && return 0
  case $INIT_NAME in
    "auto")
      if [ -f "$DSP_STATE" ]; then
        /usr/bin/lo10k1 --restore "$DSP_STATE"
      else
        for cardid in {0..20}; do [ -f "/proc/asound/card$cardid/emu10k1" ] && break; done
        card="$(expr "$(cat /proc/asound/card$cardid/id)" : '.*\(Live\|Audigy\)')" 2> /dev/null
        case $card in
          "Audigy") init_audigy_eq10 || return 1;;
          "Live")   init_live || return 1 ;;
          *)
            if (( "$cardid" >= 20 )); then
              echo "Do you realy have emu10k1 card?"
            else
              echo "FIXME: Send me your /proc/asound/card$cardid/id entry and oryginal card name."
            fi
            echo "Workaround: Change INIT_NAME=(your) in conf.d and then run daemon start and store."
            return 1
        esac
      fi  
      ;;
    *) init_$INIT_NAME &> /dev/null || return 1
  esac
}
sub_restore_ALSA() {
  /usr/sbin/alsactl $ALSA_ARGS --file "$ASOUND_STATE" restore > /dev/null || return 1

  POWERSAVE=${POWERSAVE:-0}
  if [ -e /sys/module/snd_ac97_codec/parameters/power_save -a $POWERSAVE -ne 0 ]; then
    echo $POWERSAVE > /sys/module/snd_ac97_codec/parameters/power_save
    [ -c /dev/dsp ] && echo 1 > /dev/dsp
  fi

  if [ -e /sys/module/snd_hda_intel/parameters/power_save -a $POWERSAVE -ne 0 ]; then
    echo $POWERSAVE > /sys/module/snd_hda_intel/parameters/power_save
    [ -c /dev/dsp ] && echo 1 > /dev/dsp
  fi

  return 0
}


#-------------------------------------------------------------------------------
#  Daemon functions
#-------------------------------------------------------------------------------
sub_daemon_mute_master_mixer() {
  if [[ "$MUTE_MASTER_MIXER" =~ [Yy] ]]; then
    stat_busy "Mute ALSA Master Mixer"
    amixer set Master 0 &> /dev/null
    sub_stat_return $?
  fi
}
sub_daemon_store_master_mixer() {
  if [[ "$STORE_MASTER_MIXER" =~ [Yy] ]]
  then
    stat_busy "Saving ALSA Master Mixer"
    sub_store_master_mixer
    sub_stat_return $?
  fi
}
sub_daemon_store_alsa() {
  if [[ "$STORE_ALSA" =~ [Yy] ]]; then
    stat_busy "Saving ALSA Levels"
    sub_store_ALSA
    sub_stat_return $?
  else
    sub_daemon_store_master_mixer
  fi
}
sub_daemon_store_dsp() {
    if [[ $STORE_DSP =~ [Yy] ]]; then
      stat_busy "Saving ALSA DSP Levels"
      sub_store_DSP
      sub_stat_return $? && sub_lock_touch
    fi
}


#-------------------------------------------------------------------------------
#  Main functions
#-------------------------------------------------------------------------------
sub_daemon_store() {
  if [[ "$STOP_WITH_STORE" =~ [Yy] ]]; then
    sub_daemon_store_alsa
    sub_daemon_store_dsp
  else
    sub_daemon_store_master_mixer
  fi

  sub_daemon_mute_master_mixer
}
sub_daemon_restore_master_mixer() {
  if [[ "$STORE_MASTER_MIXER" =~ [Yy] ]]
  then
    [[ "$STOP_WITH_STORE" =~ [Yy] ]] && [[ "$STORE_ALSA" =~ [Yy] ]] && return 0
    stat_busy "Restoring ALSA Master Mixer"
    amixer set Master `cat "$MASTER_STATE"` > /dev/null
    sub_stat_return $?
  fi
}
sub_daemon_restore(){
  stat_busy "Restoring ALSA DSP Levels"
  sub_restore_DSP
  sub_stat_return $? && sub_lock_touch

  stat_busy "Restoring ALSA Levels"
  sub_restore_ALSA
  sub_stat_return $?

  sub_daemon_restore_master_mixer
}
sub_daemon_start() {
  test -f "/var/run/daemons/alsa" && sub_first_run
  stat_busy "Starting ALSA DSP Processor"
  /usr/sbin/ld10k1d start &> /dev/null
  if sub_stat_return $?; then
    add_daemon alsa-emu10k1d
    sub_daemon_restore
  fi
}
sub_daemon_stop() {
  sub_daemon_store
  stat_busy "Stopping ALSA DSP processor"
  /usr/sbin/ld10k1d stop &> /dev/null
  sub_stat_return $? && rm_daemon alsa-emu10k1d
}
sub_daemon_restart() {
  sub_daemon_stop
  sleep 1
  sub_daemon_start
}

sub_update_to_new_version

case "$1" in
  start)   sub_daemon_start;;
  stop)    sub_daemon_stop;;
  store)   STOP_WITH_STORE="Yes" STORE_ALSA="Yes" STORE_DSP="Yes" sub_daemon_store;;
  restore) sub_daemon_restore;;
  restart) sub_daemon_restart;;
  *) echo "usage: $0 {start|stop|store|restore|restart}"
esac

exit 0
