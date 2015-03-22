#!/bin/bash

# set -x

#-BASH-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-END BASH-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-VARS-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
. '/data/shells/bash/lib/start.var'
. "${LIB_DIR}/menu.var"
#-END VARS-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-FUNCTIONS------------------------------------------------------------------------------------------------------------------------------------------------------------------------
. "${LIB_DIR}/start.fn"
. "${LIB_DIR}/menu.fn"
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_VARS_CAL () {
  [ -z "${YEAR}" ] && YEAR=${NOW_YEAR}
  [ -z "${DAY_COUNT}" ] && DAY_COUNT=${NOW_DAY_COUNT}
  [ -z "${MOUNT_COUNT}" ] && MOUNT_COUNT=${NOW_MOUNT_COUNT}
  [ -z "${DATA}" ] && DATA=${NOW_DATA}
  YEAR_TYPE="${YEAR}"
  let "YEAR_TYPE %= 4"
  case ${DAY_COUNT} in
    0)
      DAY_TEXT='Вс'
      COLUMN='20'
      ;;
    1)
      DAY_TEXT='Пн'
      COLUMN='2'
      ;;
    2)
      DAY_TEXT='Вт'
      COLUMN='5'
      ;;
    3)
      DAY_TEXT='Ср'
      COLUMN='8'
      ;;
    4)
      DAY_TEXT='Чт'
      COLUMN='11'
      ;;
    5)
      DAY_TEXT='Пт'
      COLUMN='14'
      ;;
    6)
      DAY_TEXT='Сб'
      COLUMN='17'
      ;;
  esac
  case ${MOUNT_COUNT} in
    01)
      MOUNT_TEXT='Январь'
      MAX='31'
      ;;
    02)
      MOUNT_TEXT='Февраль'
      MAX='28'
      [ "${YEAR_TYPE}" -eq '0' ] && MAX=29
      ;;
    03)
      MOUNT_TEXT='Март'
      MAX='31'
      ;;
    04)
      MOUNT_TEXT='Апрель'
      MAX='30'
      ;;
    05)
      MOUNT_TEXT='Май'
      MAX='31'
      ;;
    06)
      MOUNT_TEXT='Июнь'
      MAX='30'
      ;;
    07)
      MOUNT_TEXT='Июль'
      MAX='31'
      ;;
    08)
      MOUNT_TEXT='Август'
      MAX='31'
      ;;
    09)
      MOUNT_TEXT='Сентябрь'
      MAX='30'
      ;;
    10)
      MOUNT_TEXT='Октябрь'
      MAX='31'
      ;;
    11)
      MOUNT_TEXT='Ноябрь'
      MAX='30'
      ;;
    12)
      MOUNT_TEXT='Декабрь'
      MAX='31'
      ;;
  esac
  if [ "`echo "${DATA}" | wc -c`" -eq 2 ]
    then
      [ `echo "${DATA}" | cut -c 1` != '-' ] && DAY_TYPE=`cat ${RES} | grep "0${DATA}.${MOUNT_COUNT}.${YEAR}" | awk -F'|' '{print $2}'`
    else
      [ `echo "${DATA}" | cut -c 1` != '-' ] && DAY_TYPE=`cat ${RES} | grep "${DATA}.${MOUNT_COUNT}.${YEAR}" | awk -F'|' '{print $2}'`
  fi
  COLOR='\033[0m'
  case "${DAY_TYPE}" in
    1)
      COLOR='\033[31m'
      ;;
    2)
      COLOR='\033[32m'
      ;;
    3)
      COLOR='\033[33m'
      ;;
  esac
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_PRINT_CAL () {
  clear
  _VARS_CAL
  while [ "${DATA}" -ne '1' ]
    do
      DATA=`echo "${DATA}-1" | bc`
      DAY_COUNT=`echo "${DAY_COUNT}-1" | bc`
      [ "${DAY_COUNT}" -lt '0' ] && DAY_COUNT=6
    done
  echo -e "
${MOUNT_TEXT} ${YEAR}

  Пн Вт Ср Чт Пт \033[31mСб Вс\033[0m

"
  LINE_CAL=6
  [ `echo ${NOW_DATA} | cut -c 1` -eq '0' ] && NOW_DATA=`echo ${NOW_DATA} | cut -c 2`
  while [ "${DATA}" -le "${MAX}" ]
    do
      _VARS_CAL
      if [ "${DATA}${MOUNT_COUNT}${YEAR}" = "${NOW_DATA}${NOW_MOUNT_COUNT}${YEAR}" ]
        then
          NOW_LINE_CAL=${LINE_CAL}
      	  NOW_COLUMN=${COLUMN}
          NOW_COLOR=${COLOR}
      fi
      tput cup ${LINE_CAL} ${COLUMN}      
      if [ `echo "${DATA}" | wc -c` -eq 3 ]
        then
          echo -e "${COLOR}${DATA}\033[0m"
        else
          echo -e "${COLOR} ${DATA}\033[0m"
      fi
      DATA=`echo "${DATA}+1" | bc`
      DAY_COUNT=`echo "${DAY_COUNT}+1" | bc`
      case "${DAY_COUNT}" in
      	1)
          LINE_CAL=`echo "${LINE_CAL}+2" | bc`
          ;;
      	7)
          DAY_COUNT=0
          ;;
      esac
    done
  echo -e "

\033[1mСтрелки\033[0m   - передвижение по календарю
\033[1mInsert\033[0m    - установка признака дня (выходной/праздничный)
\033[1mDelete\033[0m    - удаление признака дня
\033[1mHome\033[0m      - возврат в сегодняшнее число
\033[1mEnd\033[0m       - завершение работы
\033[1mPage Up\033[0m   - перейти на месяц назад
\033[1mPage Down\033[0m - перейти на месяц вперед
\033[1mEnter\033[0m     - выбрать день

\033[1;032m██\033[0m      - праздничный день
\033[1;033m██\033[0m      - предпраздничный день
\033[1;031m██\033[0m      - выходной день

По умолчанию выходных и празлничных дней не задано (даже сб и вс)
При установке признаки дней сохраняются в файл \033[1m${RES}\033[0m
"
  DATA=`echo "${DATA}-1" | bc`
  DAY_COUNT=`echo "${DAY_COUNT}-1" | bc`
  [ "${DAY_COUNT}" -lt '0' ] && DAY_COUNT=6
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_CURSOR_CAL () {
  tput cup $((${LINE_CAL}-1)) $((${COLUMN}-1)); echo -e "\033[1;36m┌──┐"
  tput cup ${LINE_CAL} $((${COLUMN}-1)); 	    echo -e "│"
  tput cup ${LINE_CAL} $((${COLUMN}+2));	    echo -e "│"
  tput cup $((${LINE_CAL}+1)) $((${COLUMN}-1)); echo -e "└──┘\033[0m"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_NO_CURSOR_CAL () {
  tput cup $((${LINE_CAL}-1)) $((${COLUMN}-1)); echo '    '
  tput cup ${LINE_CAL} $((${COLUMN}-1)); 	    echo ' '
  tput cup ${LINE_CAL} $((${COLUMN}+2));	    echo ' '
  tput cup $((${LINE_CAL}+1)) $((${COLUMN}-1)); echo '    '
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_KEY_CAL () {
  stty -echo
  read -n3 ARROW_CAL
  stty echo
  ARROW_CAL=`echo ${ARROW_CAL} | cut -c 3`
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_GO_CAL () {
  case ${ARROW_CAL} in
    H|1) # HOME
#      read -n1
      _START_CAL
      ;;
    2) # INSERT
      read -n1
      _MENU_CAL
      ;;
    3) # DELETE
      read -n1
      tput cup 50 0 
      cat ${RES} | grep -v "${DATA}.${MOUNT_COUNT}.${YEAR}" > ${TMP}
      cp ${RES} ${RES}.old
      mv ${TMP} ${RES}
      if [ "$?" -eq '0' ]
        then
          echo "Признак удален."
        else
          echo ERROR
      fi
      _STOP
      tput civis
      NOW_DATA=${DATA}
      NOW_DAY_COUNT=${DAY_COUNT}
      NOW_MOUNT_COUNT=${MOUNT_COUNT}
      NOW_YEAR=${YEAR}
      _PRINT_CAL
      DATA=${NOW_DATA}
      DAY_COUNT=${NOW_DAY_COUNT}
      LINE_CAL=${NOW_LINE_CAL}
      COLUMN=${NOW_COLUMN}
      ;;
    F|4) # END
#      read -n1
      clear
      tput cnorm
      _CL_TMP
      exit
      ;;
    5) # PAGE UP
      read -n1
      MOUNT_COUNT=`echo "${MOUNT_COUNT}-1" | bc`
      [ "${MOUNT_COUNT}" -lt '0' ] && MOUNT_COUNT=12
      [ `echo ${MOUNT_COUNT} | wc -c` -eq '2' ] && MOUNT_COUNT="0${MOUNT_COUNT}"
      _VARS_CAL
      MOUNT_COUNT=${NOW_MOUNT_COUNT}
      DATA=`echo "${DATA}-${MAX}" | bc`
      if [ "${DATA}" -gt '0' ]
        then
          DAY_COUNT=`echo "${DAY_COUNT}-${DATA}" | bc`
          DATA=0
      fi
      DAY_COUNT=`echo "${DAY_COUNT}-${MAX}" | bc`
      while [ "${DAY_COUNT}" -lt '0' ]
        do
          DAY_COUNT=`echo "${DAY_COUNT}+7" | bc`
        done
      ;;
    6) # PAGE DOWN
      read -n1
      DAY_COUNT=`echo "${DAY_COUNT}+${MAX}" | bc`
      MOUNT_COUNT=`echo "${MOUNT_COUNT}+1" | bc`
      [ "${MOUNT_COUNT}" -gt '12' ] && MOUNT_COUNT=01
      [ `echo ${MOUNT_COUNT} | wc -c` -eq '2' ] && MOUNT_COUNT="0${MOUNT_COUNT}"
      _VARS_CAL
      if [ "${DATA}" -gt "${MAX}" ]
        then
          DAY_COUNT=`echo "${DAY_COUNT}-${DATA}+${MAX}" | bc`
          DATA=${MAX}
      fi
      while [ "${DAY_COUNT}" -gt '6' ]
        do
          DAY_COUNT=`echo "${DAY_COUNT}-7" | bc`
        done
      MOUNT_COUNT=${NOW_MOUNT_COUNT}
      _VARS_CAL
      DATA=`echo "${DATA}+${MAX}" | bc`
      ;;
    A) # UP    
      LINE_CAL=`echo "${LINE_CAL}-2" | bc`
      DATA=`echo "${DATA}-7" | bc`
      ;;
    B) # DOWN
      LINE_CAL=`echo "${LINE_CAL}+2" | bc`
      DATA=`echo "${DATA}+7" | bc`
      ;;
    C) # RIGHT
      DATA=`echo "${DATA}+1" | bc`
      DAY_COUNT=`echo "${DAY_COUNT}+1" | bc`
      case "${DAY_COUNT}" in
        1)
          LINE_CAL=`echo "${LINE_CAL}+2" | bc`
          ;;
        7)
          DAY_COUNT=0
          ;;
      esac
      ;;
    D) # LEFT
      DATA=`echo "${DATA}-1" | bc`
      DAY_COUNT=`echo "${DAY_COUNT}-1" | bc`
      case "${DAY_COUNT}" in
        '-1')
          DAY_COUNT=6
          ;;
        0)
          LINE_CAL=`echo "${LINE_CAL}-2" | bc`
          ;;
      esac
      ;;
#    F) # END
#      ;;
#    H) # HOME
#      ;;
  esac
  _VARS_CAL
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_NEW_CAL () {
  if [ "${DATA}" -lt '1' ]
    then
      MOUNT_COUNT=`echo "${MOUNT_COUNT}-1" | bc`
      if [ "${MOUNT_COUNT}" -lt '1' ]
        then
          YEAR=`echo "${YEAR}-1" | bc`
          MOUNT_COUNT=12
      fi
      [ `echo "${MOUNT_COUNT}" | wc -c` -eq '2' ] && MOUNT_COUNT="0${MOUNT_COUNT}"
      _VARS_CAL
      DATA=`echo "${DATA}+${MAX}" | bc`
      NOW_DATA=${DATA}
      NOW_DAY_COUNT=${DAY_COUNT}
      NOW_MOUNT_COUNT=${MOUNT_COUNT}
      NOW_YEAR=${YEAR}
      _VARS_CAL
      _PRINT_CAL
      DATA=${NOW_DATA}
      DAY_COUNT=${NOW_DAY_COUNT}
      LINE_CAL=${NOW_LINE_CAL}
      COLUMN=${NOW_COLUMN}
  fi
  if [ "${DATA}" -gt "${MAX}" ]
    then
      MOUNT_COUNT=`echo "${MOUNT_COUNT}+1" | bc`
      if [ "${MOUNT_COUNT}" -gt '12' ]
        then
          YEAR=`echo "${YEAR}+1" | bc`
          MOUNT_COUNT=01
      fi
      [ `echo "${MOUNT_COUNT}" | wc -c` -eq '2' ] && MOUNT_COUNT="0${MOUNT_COUNT}"
      DATA=`echo "${DATA}-${MAX}" | bc`
      NOW_DATA=${DATA}
      NOW_DAY_COUNT=${DAY_COUNT}
      NOW_MOUNT_COUNT=${MOUNT_COUNT}
      NOW_YEAR=${YEAR}
      _PRINT_CAL
      DATA=${NOW_DATA}
      DAY_COUNT=${NOW_DAY_COUNT}
      LINE_CAL=${NOW_LINE_CAL}
      COLUMN=${NOW_COLUMN}
  fi
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_CASE_CAL () {
  while [ "${ARROW_CAL}" != '' ]
    do
      _KEY_CAL
      _NO_CURSOR_CAL
      _GO_CAL
      _NEW_CAL
      _CURSOR_CAL
    done
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_START_CAL () {
  ARROW_CAL=q
  NOW_DATA=`date +%d`
  NOW_MOUNT_COUNT=`date +%m`
  NOW_YEAR=`date +%Y`
  NOW_DAY_COUNT=`date +%w`
  DATA=
  DAY_COUNT=
  MOUNT_COUNT=
  YEAR=
  LINE_CAL=
  COLUMN=
#  [ -f ${TMP} ] && . ${TMP}
  tput civis
  _PRINT_CAL
  DATA=${NOW_DATA}
  DAY_COUNT=${NOW_DAY_COUNT}
  LINE_CAL=${NOW_LINE_CAL}
  COLUMN=${NOW_COLUMN}
  _CURSOR_CAL
  _CASE_CAL
  
  tput cup 50 0
  tput cnorm
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_MENU_CAL () {
  [ `echo ${DATA} | wc -c` -eq '2' ] && DATA="0${DATA}"
  STRING=`cat ${RES} | grep "${DATA}.${MOUNT_COUNT}.${YEAR}"`
  [ -z "${STRING}" ] && echo "${DATA}.${MOUNT_COUNT}.${YEAR}|0" >> ${RES}
  RAZD=1
  while [ "${STEP}" -ne '0' ]
    do
      _MENU "Добавление описания дня: ${DATA}.${MOUNT_COUNT}.${YEAR}" "Выходной
Праздничный
Предпраздничный"
      if [ "${STEP}" -ne '0' ]
        then
          sed "s/${DATA}\.${MOUNT_COUNT}\.${YEAR}|./${DATA}\.${MOUNT_COUNT}\.${YEAR}|${STEP}/" ${RES} > ${TMP}
          cp ${RES} ${RES}.old
          mv ${TMP} ${RES}
          if [ "$?" -eq '0' ]
            then
              echo "Признак выставлен."
            else
              echo ERROR
          fi
          _STOP
      fi
    done
  tput civis
  STEP=1
  [ `echo ${DATA} | cut -c 1` -eq '0' ] && DATA=`echo ${DATA} | cut -c 2`
  NOW_DATA=${DATA}
  NOW_DAY_COUNT=${DAY_COUNT}
  NOW_MOUNT_COUNT=${MOUNT_COUNT}
  NOW_YEAR=${YEAR}
  _PRINT_CAL
  DATA=${NOW_DATA}
  DAY_COUNT=${NOW_DAY_COUNT}
  LINE_CAL=${NOW_LINE_CAL}
  COLUMN=${NOW_COLUMN}
}
#-END FUNCTIONS--------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-PROGRAM--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
[ ! -f ${RES} ] && touch ${RES}
_START_CAL
echo "Case: ${DAY_TEXT} ${DATA}.${MOUNT_COUNT}.${YEAR}"
_CL_TMP
_EXIT 0
#-END PROGRAM----------------------------------------------------------------------------------------------------------------------------------------------------------------------
