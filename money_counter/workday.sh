#!/bin/bash

#set -x

#-BASH-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-END BASH-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-VARS-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
. '/data/shells/bash/lib/start.var'
. "${LIB_DIR}/date.var"
#-END Vars-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-FUNCTIONS------------------------------------------------------------------------------------------------------------------------------------------------------------------------
. "${LIB_DIR}/start.fn"
. "${LIB_DIR}/date.fn"
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_VARS () {
  DAY=`echo ${1} | awk -F'.' '{print $1}'`
  MOUNT=`echo ${1} | awk -F'.' '{print $2}'`
  YEAR=`echo ${1} | awk -F'.' '{print $3}'`
  case ${MOUNT} in
    01)
      MOUNT_1='января'
      ;;
    02)
      MOUNT_1='февраля'
      ;;
    03)
      MOUNT_1='марта'
      ;;
    04)
      MOUNT_1='апреля'
      ;;
    05)
      MOUNT_1='мая'
      ;;
    06)
      MOUNT_1='июня'
      ;;
    07)
      MOUNT_1='июля'
      ;;
    08)
      MOUNT_1='августа'
      ;;
    09)
      MOUNT_1='сентября'
      ;;
    10)
      MOUNT_1='октября'
      ;;
    11)
      MOUNT_1='ноября'
      ;;
    12)
      MOUNT_1='декабря'
      ;;
  esac
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_HELP () {
  echo
  echo "Запуск: ${SHELLS_DIR}/workday.sh <key> [data]
        
                <key>:
                      -add          - добавление записи
                      -ls           - просмотр графика
                      -edit <date>  - редактирование смены
                      -del <date>   - удаление смены
                      -?            - подсказка"
  echo
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_READ_STOP () {
  DAY_DEF=2
  NIGHT_DEF=0
  [ -n "$1" ] && DAY_DEF=$1
  [ -n "$2" ] && NIGHT_DEF=$2
  echo -n "Укажите количество перерывов (день/ночь, по умолчанию ${DAY_DEF}/${NIGHT_DEF}): "
  tput sc
  echo '_/_'
  tput rc
  read -n1 STOP_DAY
  if [ -n "${STOP_DAY}" ]
    then
      echo -n '/'
      read -n1 STOP_NIGHT
      [ -z "${STOP_NIGHT}" ] && STOP_NIGHT=${NIGHT_DEF}
      echo
    else
      STOP_DAY=${DAY_DEF}
      STOP_NIGHT=${NIGHT_DEF}
  fi
  echo -n "Вы брали обед? "
  read -n1 x
  echo
  case $x in
    y|Y|н|Н)
      LANCH=1
      ;;
    *)
      LANCH=0
      ;;
  esac
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_ADD_WORKDAY () {
  if [ -f "${RES}" ] 
    then
      CONTROL=`tail -1 ${RES} | awk -F'|' '{print $2}'`
      _VARS "${CONTROL}"
      CONTROL="${YEAR}${MOUNT}${DAY}"
      echo "
Последняя записанная смена ${DAY}-го ${MOUNT_1} ${YEAR}-го года: `tail -1 ${RES} | awk -F'|' '{print $3 " - " $4}'`
"
    else
      echo "
Файл графика отсутствует.
"
  fi
  _READ_DATE
  _VARS "${DATE}"
  if [ -f "${RES}" ]
    then
      STRING=`cat ${RES} | grep "${DATE}"`
      if [ -n "${STRING}" ]
        then
          echo "
Cмена ${DAY}-го ${MOUNT_1} ${YEAR}-го года уже есть!
"
          _EXIT 6
      fi
  fi
  _READ_TIME '-text' "начала смены" '-time' '15:00'
  START="${TIME}"
  _READ_TIME '-text' "окончания смены" '-time' '00:00'
  _READ_STOP
  case ${LANCH} in
    1)
      x=Да
      ;;
    0)
      x=Нет
      ;;
  esac
  [ -n "${CONTROL}" ] && DATE_1="${YEAR}${MOUNT}${DAY}"
  echo "
Дата:  ${DAY}-е ${MOUNT_1} ${YEAR}-го года
Смена: ${START} - ${TIME}
Дневных перерывов: ${STOP_DAY}
Ночных перерывов: ${STOP_NIGHT}
Обед:  ${x}
"
  echo -n "Добавить? "
  read -n1 OTVET
  echo
  case ${OTVET} in
    y|Y|н|Н)
      echo "|${DATE}|${START}|${TIME}|${STOP_DAY}|${STOP_NIGHT}|${LANCH}|" >> ${RES}
      if [ "$?" -eq '0' ]
        then
          echo "Запись успешно добавлена."
          if [ "${DATE_1}" \< "${CONTROL}" ]
            then
              [ -f "${TMP}" ] && rm ${TMP}
              COUNT=`cat ${RES} | wc -l`
              for ((x=1;x<=${COUNT};x++))
                do
                  DAY=`cat ${RES} | awk "NR==${x}" | cut -c 2-3`
                  MOUNT=`cat ${RES} | awk "NR==${x}" | cut -c 5-6`
                  YEAR=`cat ${RES} | awk "NR==${x}" | cut -c 8-11`
                  OTH=`cat ${RES} | awk "NR==${x}" | cut -c 13-`
                  echo "|${YEAR}.${MOUNT}.${DAY}|${OTH}" >> ${TMP}
                done
              cat ${TMP} | sort > ${TMP}.sort
              rm ${TMP}
              for ((x=1;x<=${COUNT};x++))
                do
                  DAY=`cat "${TMP}.sort" | awk "NR==${x}" | cut -c 10-11`
                  MOUNT=`cat "${TMP}.sort" | awk "NR==${x}" | cut -c 7-8`
                  YEAR=`cat "${TMP}.sort" | awk "NR==${x}" | cut -c 2-5`
                  OTH=`cat "${TMP}.sort" | awk "NR==${x}" | cut -c 13-`
                  echo "|${DAY}.${MOUNT}.${YEAR}|${OTH}" >> ${TMP}
                done
              cp ${RES} ${RES}.old
              mv ${TMP} ${RES}
              rm ${TMP}*
              [ "$?" -eq '0' ] && echo "График отсортирован."
          fi
      fi
      ;;
    *)
      ;;
  esac
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_LS_WORKDAY () {
  _WHO_MORE "$1" "$2"
  if [ "${SRAVN}" -eq '1' ]
    then
      echo "
Дата начала учетного периода не может быть меньше даты его окончания.
"
      _EXIT 3
  fi
  echo
  tput civis
  tput sc
  echo "График работы с $1 по $2
┌────────────┬───────┬───────┐
│    Дата    │ Старт │ Конец │
├────────────┼───────┼───────┤" > ${TMP}
  DATE_START="${1}"
  _NEXT_DATA "${2}"
  DATE_END="${DATE}"
  DATE="${NOW_DATE}"
  DAY=`date +%w`
  _WHO_MORE "${DATE}" "${DATE_START}"
  while [ ${SRAVN} -ne 0 ]
    do
      case ${SRAVN} in
        1)
          _PREV_DATA "${DATE}"
          ((DAY--))
          [ ${DAY} -eq '-1' ] && DAY=6
          ;;
        2)
          _NEXT_DATA "${DATE}"
          ((DAY++))
          [ ${DAY} -eq '7' ] && DAY=0
          ;;
      esac
      _WHO_MORE "${DATE}" "${DATE_START}"
      echo "Высчитываем день недели: ${DATE} ${DAY}"
      tput rc
    done
  DATE="${DATE_START}"
  SRAVN=2
  while [ "${SRAVN}" -ne '0' ]
    do
      STRING=`cat ${RES} | grep "${DATE}" | awk -F'|' '{print "│ " $2 " │ " $3 " │ " $4 " │"}'`
      [ -z "${STRING}" ] && STRING="│ ${DATE} │ --:-- │ --:-- │"
      echo "${STRING}" >> ${TMP}
      echo "
Формируем график: ${STRING}"
      tput rc
      _NEXT_DATA ${DATE}
      ((DAY++))
      [ ${DAY} -eq '7' ] && DAY=0
      [ ${DAY} -eq '1' -a "${DATE}" != "${DATE_END}" ] && echo "├────────────┼───────┼───────┤" >> ${TMP}
      _WHO_MORE "${DATE}" "${DATE_END}"
    done
  echo "└────────────┴───────┴───────┘" >> ${TMP}
  tput ed
  cat ${TMP}
  tput cnorm
  _READ_PRINT "${TMP}"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_EDIT_WORKDAY () {
  STRING=`cat ${RES} | grep "$1"`
  if [ -z "${STRING}" ]
    then
      echo "
Указанной смены не существует.
"
      _EXIT 4
  fi
  START=`echo "${STRING}" | awk -F'|' '{print $3}'`
  END=`echo "${STRING}" | awk -F'|' '{print $4}'`
  STOP_DAY_DEF=`echo "${STRING}" | awk -F'|' '{print $5}'`
  STOP_NIGHT_DEF=`echo "${STRING}" | awk -F'|' '{print $6}'`
  LANCH_DEF=`echo "${STRING}" | awk -F'|' '{print $7}'`
  _READ_TIME '-text' "начала смены" '-time' "${START}"
  START_NEW=${TIME}
  _READ_TIME '-text' "окончания смены" '-time' "${END}"
  _READ_STOP "${STOP_DAY_DEF}" "${STOP_NIGHT_DEF}"
  [ -z $x ] && LANCH=${LANCH_DEF} 
  _VARS $1
  case ${LANCH_DEF} in
    0)
      LANCH_DEF_TEXT=Нет
      ;;
    1)
      LANCH_DEF_TEXT=Да
      ;;
  esac
  case ${LANCH} in
    0)
      LANCH_TEXT=Нет
      ;;
    1)
      LANCH_TEXT=Да
      ;;
  esac
    echo -n "
Дата:  ${DAY}-е ${MOUNT_1} ${YEAR}-го года

Смена: ${START} - ${END}
Дневных перерывов: ${STOP_DAY_DEF}
Ночных перерывов: ${STOP_NIGHT_DEF}
Обед:  ${LANCH_DEF_TEXT}

Будет заменена на

Смена: ${START_NEW} - ${TIME}
Дневных перерывов: ${STOP_DAY}
Ночных перерывов: ${STOP_NIGHT}
Обед:  ${LANCH_TEXT}

Вы уверены? "
  read -n1 x
  echo
  if [ "${x}" = 'y' -o "${x}" = 'Y' ]
    then
      cat ${RES} | sed "s/|$1|${START}|${END}|${STOP_DAY_DEF}|${STOP_NIGHT_DEF}|${LANCH_DEF}|/|${1}|${START_NEW}|${TIME}|${STOP_DAY}|${STOP_NIGHT}|${LANCH}|/" > ${TMP}
      cp ${RES} ${RES}.old
      cp ${TMP} ${RES}
      [ "$?" -eq '0' ] && echo "
Смена успешно отредактирована.
"
  fi
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_DEL_WORKDAY () {
  STRING=`cat ${RES} | grep $1`
  if [ -z "${STRING}" ]
    then
      echo "
Указанной смены не существует.
"
      _EXIT 5
  fi
  DATE=`echo "${STRING}" | awk -F'|' '{print $2}'`
  START=`echo "${STRING}" | awk -F'|' '{print $3}'`
  END=`echo "${STRING}" | awk -F'|' '{print $4}'`
  _VARS "${DATE}"
  echo -n "Подтверждаете удаление смены ${DAY}-го ${MOUNT_1} ${YEAR}-го года с ${START} до ${END}? "
  read -n1 OTVET
  echo
  case ${OTVET} in
    y|Y|н|Н)
      cat ${RES} | grep -v "$1" > ${TMP}
      cp ${RES} ${RES}.old
      cp ${TMP} ${RES}
      [ "$?" -eq '0' ] && echo "
Смена успешно удалена.
"
      ;;
  esac
  [ -z "`cat ${RES}`" ] && rm ${RES}
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_TABEL () {

  _WHO_MORE "$1" "$2"
  if [ "${SRAVN}" -eq '1' ]
    then
      echo "
Дата начала учетного периода не может быть меньше даты его окончания.
"
      _EXIT 3
  fi
  echo
  tput civis
  tput sc
  echo "Табель с $1 по $2

┌────────────┬───────┬───────┬─────┬──────────┬──────────┬─────────────┐
│    Дата    │ Старт │ Конец │ Пер │   Часы   │  Ночные  │ Праздничные │
├────────────┼───────┼───────┼─────┼──────────┼──────────┼─────────────┤" > ${TMP}

  DATE_START="${1}"
  _NEXT_DATA "${2}"
  DATE_END="${DATE}"
  DATE="${NOW_DATE}"
  DAY=`date +%w`
  _WHO_MORE "${DATE}" "${DATE_START}"
  while [ ${SRAVN} -ne 0 ]
    do
      case ${SRAVN} in
        1)
          _PREV_DATA "${DATE}"
          ((DAY--))
          [ ${DAY} -eq '-1' ] && DAY=6
          ;;
        2)
          _NEXT_DATA "${DATE}"
          ((DAY++))
          [ ${DAY} -eq '7' ] && DAY=0
          ;;
      esac
      _WHO_MORE "${DATE}" "${DATE_START}"
      echo "Высчитывaем день недели: ${DATE} ${DAY}"
      tput rc
    done
  DATE="${DATE_START}"
  SRAVN=2
  NORMA=0
  while [ "${SRAVN}" -ne '0' ]
    do
      DAY_TYPE=`cat ${CALEND} | grep "${DATE}" | awk -F'|' '{print $2}'`
      case ${DAY_TYPE} in
        '')
          NORMA=`echo "${NORMA}+480" | bc`
          ;;
        '3')
          NORMA=`echo "${NORMA}+420" | bc`
          ;;
        *)
          ;;
      esac
      _NEXT_DATA ${DATE}
      _WHO_MORE "${DATE}" "${DATE_END}"
      echo "
Высчитываем норму часов: `echo "scale=2; ${NORMA}/60" | bc`" | sed "s/[0-9][0-9][0-9]\./ &/g" | sed "s/  / /g"
      tput rc
    done
  NORMA=`echo "scale=2; ${NORMA}/60" | bc`
  DATE="${DATE_START}"
  SRAVN=2
  AKK_HOURS=0
  AKK_NIGHT=0
  AKK_WEEKS=0
  while [ "${SRAVN}" -ne '0' ]
    do
      STRING=`cat ${RES} | grep "${DATE}"`
      if [ -z "${STRING}" ]
        then
          STRING="│ ${DATE} │ --:-- │ --:-- │ -/- │     -.-- │     -.-- │        -.-- │"
        else      
          DAY_TYPE=`cat ${CALEND} | grep "${DATE}" | awk -F'|' '{print $2}'`
          START_HOUR=`echo "${STRING}" | awk -F'|' '{print $3}' | awk -F':' '{print $1}'`      
          START_MINUTE=`echo "${STRING}" | awk -F'|' '{print $3}' | awk -F':' '{print $2}'`
          END_HOUR=`echo "${STRING}" | awk -F'|' '{print $4}' | awk -F':' '{print $1}'`
          END_MINUTE=`echo "${STRING}" | awk -F'|' '{print $4}' | awk -F':' '{print $2}'`
          COUNT_STOP_DAY=`echo "${STRING}" | awk -F'|' '{print $5}'`
          COUNT_STOP_NIGHT=`echo "${STRING}" | awk -F'|' '{print $6}'`
          START=`echo "${START_HOUR}*60+${START_MINUTE}" | bc`
          END=`echo "${END_HOUR}*60+${END_MINUTE}" | bc`
          STOP_DAY=`echo "${COUNT_STOP_DAY}*30" | bc`
          STOP_NIGHT=`echo "${COUNT_STOP_NIGHT}*30" | bc`
          [ "${END}" -lt "${START}" ] && END=`echo "${END}+1440" | bc`
          ((START++))
          HOURS=0
          NIGHT=0
          WEEKS=0
          for ((y=${START};y<=${END};y++))
            do
              ((HOURS++))
              [ "${y}" -ge '0' -a "${y}" -le '360' ] && ((NIGHT++))
              [ "${y}" -gt '1320' -a "${y}" -le '1800' ] && ((NIGHT++))
              [ "${y}" -gt '2760' -a "${y}" -le '3240' ] && ((NIGHT++))
              if [ "${DAY_TYPE}" = '2' -a "${y}" -le '1440' ]
                then
                  ((WEEKS++))
                  NIGHT=0
              fi
            done
          HOURS=`echo "${HOURS}-${STOP_DAY}-${STOP_NIGHT}" | bc`
          NIGHT=`echo "${NIGHT}-${STOP_NIGHT}" | bc`
          [ "${WEEKS}" -ne '0' ] && WEEKS=`echo "${WEEKS}-${STOP_DAY}" | bc`
          HOURS=`echo "scale=2; ${HOURS}/60" | bc`
          NIGHT=`echo "scale=2; ${NIGHT}/60" | bc`
          WEEKS=`echo "scale=2; ${WEEKS}/60" | bc`
          AKK_HOURS=`echo "${AKK_HOURS}+${HOURS}" | bc`
          AKK_NIGHT=`echo "${AKK_NIGHT}+${NIGHT}" | bc`
          AKK_WEEKS=`echo "${AKK_WEEKS}+${WEEKS}" | bc`
          while [ `echo ${HOURS} | wc -c` -ne '8' ]
            do
              HOURS="_${HOURS}"
            done
          while [ `echo ${NIGHT} | wc -c` -ne '8' ]
            do
              NIGHT="_${NIGHT}"
            done
          while [ `echo ${WEEKS} | wc -c` -ne '8' ]
            do
              WEEKS="_${WEEKS}"
            done
          HOURS=`echo "${HOURS}" | sed "s/___0/0.00/" | sed "s/_\./0./" | sed "s/[0-9_][0-9_][0-9_]\./ &/"`
          NIGHT=`echo "${NIGHT}" | sed "s/___0/0.00/" | sed "s/_\./0./" | sed "s/[0-9_][0-9_][0-9_]\./ &/"`
          WEEKS=`echo "${WEEKS}" | sed "s/___0/0.00/" | sed "s/_\./0./" | sed "s/[0-9_][0-9_][0-9_]\./ &/"`
          STRING="│ ${DATE} │ ${START_HOUR}:${START_MINUTE} │ ${END_HOUR}:${END_MINUTE} │ ${COUNT_STOP_DAY}/${COUNT_STOP_NIGHT} │ ${HOURS} │ ${NIGHT} │    ${WEEKS} │"
          STRING=`echo "${STRING}" | sed "s/_/ /g"`
      fi

      echo "

Составляем табель: ${STRING}"
      echo "                   ├────────────┴───────┴───────┴─────┼──────────┼──────────┼─────────────┤
                   │                            Итого │ ${AKK_HOURS} │ ${AKK_NIGHT} │    ${AKK_WEEKS} │" | sed "s/ 0 / 0.00 /g" | sed "s/ \./ 0./g" | sed "s/ [0-9]\./    &/g" | sed "s/ [0-9][0-9]\./   &/g" | sed "s/ [0-9][0-9][0-9]\./ &/g" | sed "s/[0-9][0-9][0-9]\./ &/g"
      tput rc
      echo "${STRING}" >> ${TMP}
      _NEXT_DATA ${DATE}
      ((DAY++))
      [ ${DAY} -eq '7' ] && DAY=0
      [ ${DAY} -eq '1' -a "${DATE}" != "${DATE_END}" ] && echo "├────────────┼───────┼───────┼─────┼──────────┼──────────┼─────────────┤" >> ${TMP}
      _WHO_MORE "${DATE}" "${DATE_END}"
    done
  while [ `echo ${AKK_HOURS} | wc -c` -ne '8' ]
    do
      AKK_HOURS="_${AKK_HOURS}"
    done
  while [ `echo ${AKK_NIGHT} | wc -c` -ne '8' ]
    do
      AKK_NIGHT="_${AKK_NIGHT}"
    done
  while [ `echo ${AKK_WEEKS} | wc -c` -ne '8' ]
    do
      AKK_WEEKS="_${AKK_WEEKS}"
    done
  while [ `echo ${NORMA} | wc -c` -ne '8' ]
    do
      NORMA="_${NORMA}"
    done
  AKK_HOURS=`echo "${AKK_HOURS}" | sed "s/___0/0.00/" | sed "s/_\./0./" | sed "s/[0-9_][0-9_][0-9_]\./ &/"`
  AKK_NIGHT=`echo "${AKK_NIGHT}" | sed "s/___0/0.00/" | sed "s/_\./0./" | sed "s/[0-9_][0-9_][0-9_]\./ &/"`
  AKK_WEEKS=`echo "${AKK_WEEKS}" | sed "s/___0/0.00/" | sed "s/_\./0./" | sed "s/[0-9_][0-9_][0-9_]\./ &/"`
  NORMA=`echo "${NORMA}" | sed "s/___0/0.00/" | sed "s/_\./0./" | sed "s/[0-9_][0-9_][0-9_]\./ &/"`
  echo "├────────────┴───────┴───────┴─────┼──────────┼──────────┼─────────────┤
│                            Итого │ ${AKK_HOURS} │ ${AKK_NIGHT} │    ${AKK_WEEKS} │
│                            Норма │ ${NORMA} │          │             │
└──────────────────────────────────┴──────────┴──────────┴─────────────┘" | sed "s/_/ /g" >> ${TMP}

  tput ed
  cat ${TMP}
  tput cnorm
  _READ_PRINT "${TMP}"
_EXIT
}
#-END FUNCTIONS--------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-PROGRAM--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if [ ! -f "${RES}" -a "$1" != '-add' ]
  then
    echo "Файл графика отсутствует."
    _EXIT 2
fi
case $1 in
  '-add')
    _ADD_WORKDAY
    ;;
  '-ls')
    shift
    _LS_WORKDAY $1 $2
    ;;
  '-edit')
    shift
    _EDIT_WORKDAY $1
    ;;
  '-del')
    shift
    _DEL_WORKDAY $1
    ;;
  '-tabel')
    shift
    _TABEL $1 $2
    ;;
  '-?')
    _HELP
    ;;
  *)
    echo 'Неверный запуск'
    _EXIT 1
    ;;
esac
_EXIT 0
#-END PROGRAM----------------------------------------------------------------------------------------------------------------------------------------------------------------------
