#!/bin/bash

#set -x

#-BASH---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-END-BASH-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-VARS---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
. '/data/shells/bash/lib/start.var'
. "${LIB_DIR}/date.var"
#-END-VARS-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-FUNCTIONS----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
. "${LIB_DIR}/start.fn"
. "${LIB_DIR}/date.fn"
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_AVANS () {

  echo -n "
Ужажите месяц и год в виде mm.YYYY (по умолчанию `date +%m.%Y`): "
  tput sc
  echo -n "__.____"
  tput rc
  read -n2 c
  if [ -n "${c}" ]
    then
      echo -n '.'
      x="${c}"
      read -n4 c
      x="${x}.${c}"
      echo
      _CONTROL_DATE "01.${x}"
      if [ "${ERROR_DATE}" -ne '0' ]
        then
          echo "
Неверный ввод!
"
          _EXIT 1
      fi
    else
      x="`date +%m.%Y`"
  fi

  tput civis
  tput sc

  DATE_END="01.${x}"
  _PREV_DATA ${DATE_END}
  DATE_START="16.${MOUNT}.${YEAR}"
  _VARS_DATE "${DATE_START}"

  echo "
Выполняем расчет с ${DATE_START} по ${DATE}"
  tput rc

  DATE="${DATE_START}"

  AKK_HOURS=0
  AKK_NIGHT=0
  AKK_WEEKS=0
  AKK_CASH_HOURS=0
  AKK_CASH_NIGHT=0
  AKK_CASH_WEEKS=0
  AKK_CASH=0

  SRAVN=2
  while [ "${SRAVN}" -ne '0' ]
    do

      _LS 1>/dev/null

      STRING=`cat ${RES_DIR}/workday.res | grep "${DATE}"`
      [ -z "${STRING}" ] && STRING="|${DATE}|00:00|00:00|0|0|0|"

      START_HOUR=`echo "${STRING}" | awk -F'|' '{print $3}' | awk -F':' '{print $1}'`
      START_MINUTE=`echo "${STRING}" | awk -F'|' '{print $3}' | awk -F':' '{print $2}'`
      END_HOUR=`echo "${STRING}" | awk -F'|' '{print $4}' | awk -F':' '{print $1}'`
      END_MINUTE=`echo "${STRING}" | awk -F'|' '{print $4}' | awk -F':' '{print $2}'`
      STOP_DAY=`echo "${STRING}" | awk -F'|' '{print $5}'`
      STOP_NIGHT=`echo "${STRING}" | awk -F'|' '{print $6}'`

      STOP_DAY=`echo "${STOP_DAY}*30" | bc`
      STOP_NIGHT=`echo "${STOP_NIGHT}*30" | bc`
      START=`echo "${START_HOUR}*60+${START_MINUTE}" | bc`
      END=`echo "${END_HOUR}*60+${END_MINUTE}" | bc`
      [ "${END}" -lt "${START}" ] && END=`echo "${END}+1440" | bc`

      ((START++))

      HOURS=0
      NIGHT=0
      WEEKS=0
      CASH_HOURS=0
      CASH_NIGHT=0
      CASH_WEEKS=0

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

      HOURS=`echo "scale=8; (${HOURS}-${STOP_DAY}-${STOP_NIGHT})/60" | bc`
      NIGHT=`echo "scale=8; (${NIGHT}-${STOP_NIGHT})/60" | bc`
      [ "${WEEKS}" -ne '0' ] && WEEKS=`echo "scale=8; (${WEEKS}-${STOP_DAY})/60" | bc`

      CASH_HOURS=`echo "scale=4; (${HOURS}*${STAKE}+0.00005555)/1" | bc`
      CASH_NIGHT=`echo "scale=4; (${NIGHT}*${STAKE}*0.40+0.00005555)/1" | bc`
      CASH_WEEKS=`echo "scale=4; (${WEEKS}*${STAKE}+0.00005555)/1" | bc`

      AKK_CASH_HOURS=`echo "${AKK_CASH_HOURS}+${CASH_HOURS}" | bc`
      AKK_CASH_NIGHT=`echo "${AKK_CASH_NIGHT}+${CASH_NIGHT}" | bc`
      AKK_CASH_WEEKS=`echo "${AKK_CASH_WEEKS}+${CASH_WEEKS}" | bc`

      echo -n "

┌────────────┬──────────────┬──────────────┬──────────────┐
│    Дата    │ Оплата часов │ Оплата ночных│Оплата праздн.│
├────────────┼──────────────┼──────────────┼──────────────┤
│ ${DATE} │"
      echo " `echo ${CASH_HOURS}*0.87 | bc` │ `echo ${CASH_NIGHT}*0.87 | bc` │ `echo ${CASH_WEEKS}*0.87 | bc` │
├────────────┼──────────────┼──────────────┼──────────────┤
│     Итого: │ `echo ${AKK_CASH_HOURS}*0.87 | bc` │ `echo ${AKK_CASH_NIGHT}*0.87 | bc` │ `echo ${AKK_CASH_WEEKS}*0.87 | bc` │
├────────────┼──────────────┼──────────────┴──────────────┘
│     Аванс: │ `echo \(${AKK_CASH_HOURS}+${AKK_CASH_NIGHT}+${AKK_CASH_WEEKS}\)*0.87 | bc` │
└────────────┴──────────────┘" | sed "s/ 0 / 0.0000 /g" | sed "s/ \./ 0./g" | sed "s/ [0-9]\./      &/g" | sed "s/ [0-9][0-9]\./     &/g" | sed "s/ [0-9][0-9][0-9]\./   &/g" | sed "s/[0-9][0-9][0-9]\./ &/g" | sed "s/ [0-9] /  &/g" | sed "s/ [0-9][0-9] / &/g"
      tput rc

      _NEXT_DATA ${DATE}
      _WHO_MORE "${DATE}" "${DATE_END}"

    done

  AKK_CASH=`echo "(${AKK_CASH_HOURS}+${AKK_CASH_NIGHT}+${AKK_CASH_WEEKS})*0.87" | bc`
  AKK_CASH=`echo "scale=2; (${AKK_CASH}+0.0055)/1" | bc`

  tput ed
  echo "
15.${x} вы должны получить аванс в размере: ${AKK_CASH} руб.
" | sed "s/ 0 / 0.00 /g" | sed "s/[0-9][0-9][0-9]\./\ &/"

  tput cnorm
  _EXIT
}
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_LS () {
  COUNT=`cat ${RES} | wc -l`
  for ((a=1;a<=${COUNT};a++))
    do
      CONTROL=`awk "NR==${a}" ${RES} | awk -F'|' '{print $2}'`
      _WHO_MORE ${DATE} ${CONTROL}
      if [ "${SRAVN}" -eq '1' -o "${SRAVN}" -eq '0' ]
        then
          STAKE=`awk "NR==${a}" ${RES} | awk -F'|' '{print $3}'`
          PRICE=`awk "NR==${a}" ${RES} | awk -F'|' '{print $4}'`
      fi
    done
  echo "
На ${DATE}: 
Почасовая ставка: ${STAKE}
Стоимость обеда:  ${PRICE}
"
}
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_ADD () {
  CONTROL=''
  if [ -f "${RES}" ]
    then
      CONTROL=`tail -1 ${RES} | awk -F'|' '{print $2}'`
      case ${NUMBER} in
        3)
          DEF=`tail -1 ${RES} | awk -F'|' '{print $3}'`
          OLD=`tail -1 ${RES} | awk -F'|' '{print $4}'`
          ;;
        4)
          DEF=`tail -1 ${RES} | awk -F'|' '{print $4}'`
          OLD=`tail -1 ${RES} | awk -F'|' '{print $3}'`
          ;;
      esac
    else
      echo "
Отсутствует файл для расчетов!
"
  fi
  _READ_DATE -text "начала действия новой ${DES}"
  
  _WHO_MORE ${DATE} ${CONTROL}
  if [ "${SRAVN}" -eq '2' ]
    then
      echo "
Неверный ввод! Дата не может быть меньше ${CONTROL}!
"
      _EXIT 2
  fi
  echo -n "Укажите значение новой ${DES} (по умолчанию: ${DEF}): "
  tput sc
  echo -n "___.__"
  tput rc
  read -n3 x
  if [ -n "${x}" ]
    then
      echo -n '.'
      NEW="${x}"
      read -n2 x
      echo
      NEW="${NEW}.${x}"
    else
      NEW=${DEF}
  fi
  echo -n "
Будет добавлена запись о том, что с ${DATE} значение новой ${DES}: ${NEW}
Вы уверены? "
  read  -n1 x
  echo
  case ${x} in
    y|Y|н|Н)
      case ${NUMBER} in
        3)
          echo "|${DATE}|${NEW}|${OLD}|" >> ${RES}
          [ "$?" -eq '0' ] && echo "Запись успешно добавлена."
          ;;
        4)
          echo "|${DATE}|${OLD}|${NEW}|" >> ${RES}
          [ "$?" -eq '0' ] && echo "Запись успешно добавлена."
          ;;
      esac
      ;;
  esac
}
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_CALC () {
  echo -n "
Ужажите месяц и год в виде mm.YYYY (по умолчанию `date +%m.%Y`): "
  tput sc
  echo -n "__.____"
  tput rc
  read -n2 c
  if [ -n "${c}" ]
    then
      echo -n '.'
      x="${c}"
      read -n4 c
      x="${x}.${c}"
      echo
      _CONTROL_DATE "01.${x}"
      if [ "${ERROR_DATE}" -ne '0' ]
        then
          echo "
Неверный ввод!
"
          _EXIT 1
      fi
    else
      x="`date +%m.%Y`"
  fi

  echo
  tput civis
  tput sc

  RESUL=0

  AKK_CASH=0
  AKK_UDER=0
  AKK_PLUS=0

  DATE_END="01.${x}"
  _PREV_DATA ${DATE_END}
  _VARS_DATE ${DATE}
  DATE="16.${MOUNT}.${YEAR}"

  echo "Выполняем расчет с ${DATE} по 15.${x}"
  tput rc

  while [ "${DATE}" != "16.${x}" ]
    do

      AKK_OTPUS=0
      AKK_DOPOL=0
      AKK_BONUS=0
      AKK_HOURS=0
      AKK_NIGHT=0
      AKK_WEEKS=0
      AKK_LANCH=0
      AKK_VAUCH=0
      AKK_PODAR=0
      AKK_AVANS=0
      AKK_NEDOS=0
      AKK_MESZH=0

      AKK_CASH_OTPUS=0
      AKK_CASH_DOPOL=0
      AKK_CASH_BONUS=0
      AKK_CASH_HOURS=0
      AKK_CASH_NIGHT=0
      AKK_CASH_WEEKS=0
      AKK_PLUS_PODAR=0
      AKK_PLUS_LANCH=0
      AKK_PLUS_VAUCH=0
      AKK_UDER_LANCH=0
      AKK_UDER_AVANS=0
      AKK_UDER_NEDOS=0
      AKK_UDER_MESZH=0

      while [ "${DATE}" != "${DATE_END}" ]
        do
          _VARS_DATE ${DATE}
    
          ((DAY_TYPE++))

          _LS 1>/dev/null

          DOPOLN=`cat ${RES_DIR}/plus.res | grep "${DATE}"`

          echo "
Смотрим выплаты ... ${DATE}"
          tput rc

          if [ -n "${DOPOLN}" ]
            then
              for STRING in ${DOPOLN}
                do
                  TYPE=`echo "${STRING}" | awk -F'|' '{print $3}'`
                  SUMMA=`echo "${STRING}" | awk -F'|' '{print $4}'`
                  case ${TYPE} in
                    1)
                      ;;
                    2)
                      AKK_AVANS=`echo "${AKK_AVANS}+1" | bc`
                      AKK_UDER_AVANS=`echo "${AKK_UDER_AVANS}+${SUMMA}" | bc`
                      ;;
                    3)
                      AKK_OTPUS=`echo "${AKK_OTPUS}+1" | bc`
                      AKK_CASH_OTPUS=`echo "${AKK_CASH_OTPUS}+${SUMMA}" | bc`
                      ;;
                    4)
                      AKK_DOPOL=`echo "${AKK_DOPOL}+1" | bc`
                      AKK_CASH_DOPOL=`echo "${AKK_CASH_DOPOL}+${SUMMA}" | bc`
                      ;;
                    5)
                      AKK_BONUS=`echo "${AKK_BONUS}+1" | bc`
                      AKK_CASH_BONUS=`echo "${AKK_CASH_BONUS}+${SUMMA}" | bc`
                      ;;
                    6)
                      AKK_VAUCH=`echo "${AKK_VAUCH}+1" | bc`
                      AKK_PLUS_VAUCH=`echo "${AKK_PLUS_VAUCH}+${SUMMA}" | bc`
                      ;;
                    7)
                      AKK_PODAR=`echo "${AKK_PODAR}+1" | bc`
                      AKK_PLUS_PODAR=`echo "${AKK_PLUS_PODAR}+${SUMMA}" | bc`
                      ;;
                    8)
                      AKK_NEDOS=`echo "${AKK_NEDOS}+1" | bc`
                      AKK_UDER_NEDOS=`echo "${AKK_UDER_NEDOS}+${SUMMA}" | bc`
                      [ `echo ${AKK_UDER_NEDOS} | cut -c 1` = '.' ] && AKK_UDER_NEDOS="0${AKK_UDER_NEDOS}"
                      ;;
                    9)
                      AKK_MESZH=`echo "${AKK_MESZH}+1" | bc`
                      AKK_UDER_MESZH=`echo "${AKK_UDER_MESZH}+${SUMMA}" | bc`
                      ;;
                  esac
                done
          fi

          echo "

Считаем ...         ${DATE}"
          tput ed
          tput rc

          STRING=`cat ${RES_DIR}/workday.res | grep "${DATE}"`
          [ -z "${STRING}" ] && STRING="|${DATE}|00:00|00:00|0|0|0|"
          START_HOUR=`echo ${STRING} | awk -F'|' '{print $3}' | cut -c 1-2`
          START_MINUTE=`echo ${STRING} | awk -F'|' '{print $3}' | cut -c 4-5`
          END_HOUR=`echo ${STRING} | awk -F'|' '{print $4}' | cut -c 1-2`
          END_MINUTE=`echo ${STRING} | awk -F'|' '{print $4}' | cut -c 4-5`
          STOP_DAY=`echo ${STRING} | awk -F'|' '{print $5}'`
          STOP_NIGHT=`echo ${STRING} | awk -F'|' '{print $6}'`
          LANCH=`echo ${STRING} | awk -F'|' '{print $7}'`

          STOP_DAY=`echo "${STOP_DAY}*30" | bc`
          STOP_NIGHT=`echo "${STOP_NIGHT}*30" | bc`

          START=`echo "${START_HOUR}*60+${START_MINUTE}" | bc`
          END=`echo "${END_HOUR}*60+${END_MINUTE}" | bc`
          [ "${END}" -lt "${START}" ] && END=`echo "${END}+1440" | bc`
      
          ((START++))
          HOURS=0
          NIGHT=0
          WEEKS=0
          CASH_HOURS=0
          CASH_NIGHT=0
          CASH_WEEKS=0
          PLUS_LANCH=0
          UDER_LANCH=0
          for ((y=${START};y<=${END};y++))
            do
              ((HOURS++))
              [ "${y}" -ge '0' -a "${y}" -le '360' ] && ((NIGHT++))
              [ "${y}" -gt '1320' -a "${y}" -le '1800' ] && ((NIGHT++))
              [ "${y}" -gt '2760' -a "${y}" -le '3240' ] && ((NIGHT++))
              if [ "${DAY_TYPE}" = '3' -a "${y}" -le '1440' ]
                then
                  ((WEEKS++))
                  NIGHT=0
              fi
            done
          HOURS=`echo "scale=2; (${HOURS}-${STOP_DAY}-${STOP_NIGHT})/60" | bc`
          NIGHT=`echo "scale=2; (${NIGHT}-${STOP_NIGHT})/60" | bc`
          [ "${WEEKS}" -ne '0' ] && WEEKS=`echo "scale=2; (${WEEKS}-${STOP_DAY})/60" | bc`

          AKK_HOURS=`echo "${AKK_HOURS}+${HOURS}" | bc`
          AKK_NIGHT=`echo "${AKK_NIGHT}+${NIGHT}" | bc`
          AKK_WEEKS=`echo "${AKK_WEEKS}+${WEEKS}" | bc`
          AKK_LANCH=`echo "${AKK_LANCH}+${LANCH}" | bc`

          AKK_LANCH=`echo "scale=2; ${AKK_LANCH}/1" | bc`

          CASH_HOURS=`echo "${HOURS}*${STAKE}" | bc`
          CASH_NIGHT=`echo "${NIGHT}*${STAKE}*0.40" | bc`
          CASH_WEEKS=`echo "${WEEKS}*${STAKE}" | bc` 
          PLUS_LANCH=`echo "${LANCH}*${PRICE}*0.90" | bc`
          UDER_LANCH=`echo "${LANCH}*${PRICE}*0.10" | bc`

          AKK_CASH_HOURS=`echo "${AKK_CASH_HOURS}+${CASH_HOURS}" | bc`
          AKK_CASH_NIGHT=`echo "${AKK_CASH_NIGHT}+${CASH_NIGHT}" | bc`
          AKK_CASH_WEEKS=`echo "${AKK_CASH_WEEKS}+${CASH_WEEKS}" | bc`
          AKK_PLUS_LANCH=`echo "${AKK_PLUS_LANCH}+${PLUS_LANCH}" | bc`
          AKK_UDER_LANCH=`echo "${AKK_UDER_LANCH}+${UDER_LANCH}" | bc`
          
          _NEXT_DATA ${DATE}
        done
      AKK_CASH=`echo "${AKK_CASH}+${AKK_CASH_HOURS}+${AKK_CASH_NIGHT}+${AKK_CASH_WEEKS}+${AKK_CASH_BONUS}+${AKK_CASH_DOPOL}+${AKK_CASH_OTPUS}" | bc`
      AKK_PLUS=`echo "${AKK_PLUS}+${AKK_PLUS_LANCH}+${AKK_PLUS_VAUCH}" | bc`
      
      AKK_UDER=`echo "${AKK_UDER}+${AKK_UDER_LANCH}+${AKK_UDER_AVANS}+${AKK_UDER_NEDOS}+${AKK_UDER_MESZH}" | bc`

      _PREV_DATA ${DATE}
      _VARS_DATE ${DATE}
      WORK_DAYS=`echo "scale=2; ${AKK_HOURS}/8" | bc`

      echo "


Приводим в читаемый вид ..."
      tput rc

      while [ `echo ${WORK_DAYS} | wc -c` -ne '7' ]
        do
          WORK_DAYS="_${WORK_DAYS}"
        done
      while [ `echo ${AKK_CASH_HOURS} | wc -c` -ne '10' ]
        do
          AKK_CASH_HOURS="_${AKK_CASH_HOURS}"
        done
      while [ `echo ${AKK_HOURS} | wc -c` -ne '7' ]
        do
          AKK_HOURS="_${AKK_HOURS}"
        done
      while [ `echo ${AKK_CASH_NIGHT} | wc -c` -ne '10' ]
        do
          AKK_CASH_NIGHT="_${AKK_CASH_NIGHT}"
        done
      while [ `echo ${AKK_OTPUS} | wc -c` -ne '7' ]
        do
          AKK_OTPUS="_${AKK_OTPUS}"
        done
      while [ `echo ${AKK_CASH_OTPUS} | wc -c` -ne '10' ]
        do
          AKK_CASH_OTPUS="_${AKK_CASH_OTPUS}"
        done
      while [ `echo ${AKK_VAUCH} | wc -c` -ne '7' ]
        do
          AKK_VAUCH="_${AKK_VAUCH}"
        done
      while [ `echo ${AKK_PLUS_VAUCH} | wc -c` -ne '10' ]
        do
          AKK_PLUS_VAUCH="_${AKK_PLUS_VAUCH}"
        done
      while [ `echo ${AKK_NIGHT} | wc -c` -ne '7' ]
        do
          AKK_NIGHT="_${AKK_NIGHT}"
        done
      while [ `echo ${AKK_DOPOL} | wc -c` -ne '7' ]
        do
          AKK_DOPOL="_${AKK_DOPOL}"
        done
      while [ `echo ${AKK_BONUS} | wc -c` -ne '7' ]
        do
          AKK_BONUS="_${AKK_BONUS}"
        done
      while [ `echo ${AKK_CASH_WEEKS} | wc -c` -ne '10' ]
        do
          AKK_CASH_WEEKS="_${AKK_CASH_WEEKS}"
        done
      while [ `echo ${AKK_CASH_DOPOL} | wc -c` -ne '10' ]
        do
          AKK_CASH_DOPOL="_${AKK_CASH_DOPOL}"
        done
      while [ `echo ${AKK_CASH_BONUS} | wc -c` -ne '10' ]
        do
          AKK_CASH_BONUS="_${AKK_CASH_BONUS}"
        done
      while [ `echo ${AKK_WEEKS} | wc -c` -ne '7' ]
        do
          AKK_WEEKS="_${AKK_WEEKS}"
        done
      while [ `echo ${AKK_AVANS} | wc -c` -ne '7' ]
        do
          AKK_AVANS="_${AKK_AVANS}"
        done
      while [ `echo ${AKK_LANCH} | wc -c` -ne '7' ]
        do
          AKK_LANCH="_${AKK_LANCH}"
        done
      while [ `echo ${AKK_PLUS_LANCH} | wc -c` -ne '10' ]
        do
          AKK_PLUS_LANCH="_${AKK_PLUS_LANCH}"
        done
      while [ `echo ${AKK_PODAR} | wc -c` -ne '7' ]
        do
          AKK_PODAR="_${AKK_PODAR}"
        done
      while [ `echo ${AKK_PLUS_PODAR} | wc -c` -ne '10' ]
        do
          AKK_PLUS_PODAR="_${AKK_PLUS_PODAR}"
        done
      while [ `echo ${AKK_NEDOS} | wc -c` -ne '7' ]
        do
          AKK_NEDOS="_${AKK_NEDOS}"
        done
      while [ `echo ${AKK_UDER_NEDOS} | wc -c` -ne '10' ]
        do
          AKK_UDER_NEDOS="_${AKK_UDER_NEDOS}"
        done
      while [ `echo ${AKK_MESZH} | wc -c` -ne '7' ]
        do
          AKK_MESZH="_${AKK_MESZH}"
        done
      while [ `echo ${AKK_UDER_MESZH} | wc -c` -ne '10' ]
        do
          AKK_UDER_MESZH="_${AKK_UDER_MESZH}"
        done
      while [ `echo ${AKK_UDER_AVANS} | wc -c` -ne '10' ]
        do
          AKK_UDER_AVANS="_${AKK_UDER_AVANS}"
        done
      while [ `echo ${AKK_UDER_LANCH} | wc -c` -ne '10' ]
        do
          AKK_UDER_LANCH="_${AKK_UDER_LANCH}"
        done

# ┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
# │                                              Р А С Ч Е Т Н Ы Й   Л И С Т О К                                              │
# │ Предприятие  МЕТРО Кэш энд Керри ООО                                                                                      │
# │                                                                                                                За __.____ │
# │ Г-жа Гуртова Аксения Ивановна                                                                                             │
# │ ТН:33076132                                                                            Подразделение: "Кассовый контроль" │
# │                                                                                            Должность:  Кассир             │
# │                                                                                          Оклад/Тариф: '___.__             │
# │                                                                                                                           │
# │ Долг за работником на начало месяца - 0.00                                                                                │
# │ Выплачено в течение месяца          -                                                                                     │
# │ Долг за работником на конец месяца  - 0.00                                                                                │
# ├────────────────────────────────────────────────────────────────────┬──────────────────────────────────────────────────────┤
# │                             Начисления                             │                       Удержания                      │
# ├─────────────────────────────────┬───────────┬────────────┬─────────┼─────────────────────────────┬───────────┬────────────┤
# │          Вид начисления         │   Период  │    Сумма   │   Ед.   │        Вид удержания        │   Период  │    Сумма   │
# ├─────────────────────────────────┴───────────┼────────────┼─────────┼─────────────────────────────┴───────────┼────────────┤
# │                  Начислено                  │ ___'___.__ │         │                 Удержано                │ ___'___.__ │
# ├──────┬──────────────────────────┬────┬──────┼────────────┼─────────┼──────┬──────────────────────┬────┬──────┼────────────┤
# │ /853 │         Факт-дни         │ __ │ ____ │            │ '___.__ │ 2403 │ Удержание у кассиров │ __ │ ____ │ ___'___.__ │
# │ /853 │         Факт-дни         │ __ │ ____ │            │ '___.__ │ 6100 │ Межрасчетные выплаты │ __ │ ____ │ ___'___.__ │
# │ 1201 │   КорректировкаОтпуска   │ __ │ ____ │ ___'___.__ │         │ 6101 │   Ежемесячный Аванс  │ __ │ ____ │ ___'___.__ │
# │ 1310 │      Бонус (разовый)     │ __ │ ____ │ ___'___.__ │         │ 6205 │ УдержаниеЗаПитаниеСп │ __ │ ____ │ ___'___.__ │
# │ 1318 │    ДопВыплатаКассирам    │ __ │ ____ │ ___'___.__ │         │ 6205 │ УдержаниеЗаПитаниеСп │ __ │ ____ │ ___'___.__ │
# │ 1329 │     ОплатаПоЧасамЧасы    │ __ │ ____ │ ___'___.__ │ '___.__ │ /322 │    НалогДох13Общий   │ __ │ ____ │ ___'___.__ │
# │ 1329 │     ОплатаПоЧасамЧасы    │ __ │ ____ │ ___'___.__ │ '___.__ │──────┴──────────────────────┴────┴──────┴────────────┘
# │ 3007 │     Ночные Почасовик     │ __ │ ____ │ ___'___.__ │ '___.__ │
# │ 3007 │     Ночные Почасовик     │ __ │ ____ │ ___'___.__ │ '___.__ │
# │ 3009 │ ОдинПраздничныеПочасовик │ __ │ ____ │ ___'___.__ │ '___.__ │
# ├──────┴──────────────────────────┴────┴──────┴────────────┴─────────┤
# │                            Прочие доходы                           │
# ├──────┬──────────────────────────┬────┬──────┬────────────┬─────────┤
# │ 2705 │     Питание Кластер 2    │ __ │ ____ │ ___'___.__ │  ___.__ │
# │ 2705 │     Питание Кластер 2    │ __ │ ____ │ ___'___.__ │  ___.__ │
# │ 2763 │      Сертификат 2010     │ __ │ ____ │ ___'___.__ │         │
# │ 4004 │          Подарки         │ __ │ ____ │ ___'___.__ │         │
# ├──────┴──────────────────────────┼────┼──────┼────────────┼─────────┤
# │         Пересылка в банк        │ __ │ ____ │ ___'___.__ │         │
# └─────────────────────────────────┴────┴──────┴────────────┴─────────┘

      [ "${WORK_DAYS}" != '_____0' ] && echo "│ 0853 │         Факт-дни         │ ${MOUNT} │ ${YEAR} │            │ ${WORK_DAYS} │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.cash
      [ "${AKK_OTPUS}" != '_____0' ] && echo "│ 1201 │   КорректировкаОтпуска   │ ${MOUNT} │ ${YEAR} │ ${AKK_CASH_OTPUS} │         │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.cash
      [ "${AKK_BONUS}" != '_____0' ] && echo "│ 1310 │      Бонус (разовый)     │ ${MOUNT} │ ${YEAR} │ ${AKK_CASH_BONUS} │         │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.cash
      [ "${AKK_DOPOL}" != '_____0' ] && echo "│ 1318 │    ДопВыплатаКассирам    │ ${MOUNT} │ ${YEAR} │ ${AKK_CASH_DOPOL} │         │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.cash
      [ "${AKK_HOURS}" != '_____0' ] && echo "│ 1329 │     ОплатаПоЧасамЧасы    │ ${MOUNT} │ ${YEAR} │ ${AKK_CASH_HOURS} │ ${AKK_HOURS} │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.cash
      [ "${AKK_NIGHT}" != '_____0' ] && echo "│ 3007 │     Ночные Почасовик     │ ${MOUNT} │ ${YEAR} │ ${AKK_CASH_NIGHT} │ ${AKK_NIGHT} │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.cash
      [ "${AKK_WEEKS}" != '_____0' ] && echo "│ 3009 │ ОдинПраздничныеПочасовик │ ${MOUNT} │ ${YEAR} │ ${AKK_CASH_WEEKS} │ ${AKK_WEEKS} │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.cash
      [ "${AKK_LANCH}" != '_____0' ] && echo "│ 2705 │     Питание Кластер 2    │ ${MOUNT} │ ${YEAR} │ ${AKK_PLUS_LANCH} │ ${AKK_LANCH} │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.plus
      [ "${AKK_VAUCH}" != '_____0' ] && echo "│ 2763 │      Сертификат 2010     │ ${MOUNT} │ ${YEAR} │ ${AKK_PLUS_VAUCH} │         │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.plus
      [ "${AKK_PODAR}" != '_____0' ] && echo "│ 4004 │          Подарки         │ ${MOUNT} │ ${YEAR} │ ${AKK_PLUS_PODAR} │         │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.plus
      [ "${AKK_NEDOS}" != '_____0' ] && echo " 2403 │ Удержание у кассиров │ ${MOUNT} │ ${YEAR} │ ${AKK_UDER_NEDOS} │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.uder
      [ "${AKK_MESZH}" != '_____0' ] && echo " 6100 │ Межрасчетные выплаты │ ${MOUNT} │ ${YEAR} │ ${AKK_UDER_MESZH} │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.uder
      [ "${AKK_AVANS}" != '_____0' ] && echo " 6101 │   Ежемесячный Аванс  │ ${MOUNT} │ ${YEAR} │ ${AKK_UDER_AVANS} │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.uder
      [ "${AKK_LANCH}" != '_____0' ] && echo " 6205 │ УдержаниеЗаПитаниеСп │ ${MOUNT} │ ${YEAR} │ ${AKK_UDER_LANCH} │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.uder

      _NEXT_DATA ${DATE}
      DATE_END="16.${x}"
    done

  echo "



Считаем то, что забыли ..."
  tput rc

  NALOG=`echo "(${AKK_CASH}+${AKK_PLUS})*0.13" | bc`
  NALOG=`echo "${NALOG}+.55" | bc | sed "s/\.[0-9][0-9]/\.00/"`
  AKK_UDER=`echo "${AKK_UDER}+${NALOG}" | bc`
  RESUL=`echo "${AKK_CASH}-${AKK_UDER}" | bc`

  echo "




Наводим красоту ..."
  tput rc

  while [ `echo ${NALOG} | wc -c` -ne '10' ]
    do
      NALOG="_${NALOG}"
    done
  [ "${NALOG}" != '________0' ] && echo " 9322 │    НалогДох13Общий   │ ${MOUNT} │ ${YEAR} │ ${NALOG} │" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}.uder

  while [ `echo ${AKK_CASH} | wc -c` -ne '10' ]
    do
      AKK_CASH="_${AKK_CASH}"
    done
  while [ `echo ${AKK_UDER} | wc -c` -ne '10' ]
    do
      AKK_UDER="_${AKK_UDER}"
    done
  while [ `echo ${RESUL} | wc -c` -ne '10' ]
    do
      RESUL="_${RESUL}"
    done
  echo "┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                              Р А С Ч Е Т Н Ы Й   Л И С Т О К                                              │
│ Предприятие  МЕТРО Кэш энд Керри ООО                                                                                      │
│                                                                                                                За ${MOUNT}.${YEAR} │
│ Г-жа Гуртова Аксения Ивановна                                                                                             │
│ ТН:33076132                                                                            Подразделение: \"Кассовый контроль\" │
│                                                                                            Должность:  Кассир             │
│                                                                                          Оклад\Тариф: ${STAKE}             │
│                                                                                                                           │
│ Долг за работником на начало месяца - 0.00                                                                                │
│ Выплачено в течение месяца          -                                                                                     │
│ Долг за работником на конец месяца  - 0.00                                                                                │
├────────────────────────────────────────────────────────────────────┬──────────────────────────────────────────────────────┤
│                             Начисления                             │                       Удержания                      │
├─────────────────────────────────┬───────────┬────────────┬─────────┼─────────────────────────────┬───────────┬────────────┤
│          Вид начисления         │   Период  │    Сумма   │   Ед.   │        Вид удержания        │   Период  │    Сумма   │
├─────────────────────────────────┴───────────┼────────────┼─────────┼─────────────────────────────┴───────────┼────────────┤
│                  Начислено                  │ ${AKK_CASH} │         │                 Удержано                │ ${AKK_UDER} │
├──────┬──────────────────────────┬────┬──────┼────────────┼─────────┼──────┬──────────────────────┬────┬──────┼────────────┤" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" > ${TMP}
  [ -f ${TMP} ] && sort ${TMP}.cash >> ${TMP} && rm ${TMP}.cash
  if [ -f ${TMP}.uder ]
    then
      LISTING=`sort ${TMP}.uder`
      LISTING="${LISTING}
──────┴──────────────────────┴────┴──────┴────────────┘"
      COUNT=`echo "${LISTING}" | wc -l`
      for ((x=1;x<=${COUNT};x++))
        do
          c=`echo "${x}+19" | bc`
          STRING=`awk "NR==${c}" ${TMP}`
          PLUS=`echo "${LISTING}" | awk "NR==${x}"`
          sed "s/${STRING}/&${PLUS}/g" ${TMP} > ${TMP}.new
          cp ${TMP}.new ${TMP}
        done
      rm ${TMP}.uder
      rm ${TMP}.new
  fi
  echo "├──────┴──────────────────────────┴────┴──────┴────────────┴─────────┤
│                            Прочие доходы                           │
├──────┬──────────────────────────┬────┬──────┬────────────┬─────────┤" >> ${TMP}
  [ -f ${TMP}.plus ] && sort ${TMP}.plus >> ${TMP} && rm ${TMP}.plus
  echo "├──────┴──────────────────────────┼────┼──────┼────────────┼─────────┤
│         Пересылка в банк        │ ${MOUNT} │ ${YEAR} │ ${RESUL} │         │
└─────────────────────────────────┴────┴──────┴────────────┴─────────┘
" | sed "s/[0-9_][0-9_][0-9_]\./\'&/g" | sed "s/[0-9_][0-9_][0-9_]\'/\'&/g" | sed "s/['_]/\ /g" >> ${TMP}
  echo

  tput rc
  tput ed
  tput cnorm

  cat ${TMP}
  echo -n "
Подготовить файл для печати? "
  read -n1 x
  echo
  if [ "${x}" = 'y' -o "${x}" = 'Y' ]
    then
      echo -n "Укажите путь к фалу (по умолчанию ${PRN}): "
      read -e y
      [ -z "${y}" ] && y="${PRN}"
      echo "




" > ${y}
      cat ${TMP} >> ${y}
      [ $? -eq 0 ] && echo "Файл для печати ${y} создан."
  fi
}
#-END-FUNCTIONS------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-PROGRAM------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if [ ! -f "${RES}" -a "$1" != '-add' ]
  then
    echo "
Отсутствует файл для расчетов!
"
    _EXIT 1
fi
case $1 in
  '-add')
    shift
    case $1 in
      'stake')
        NUMBER=3
        DES='ставки'
        ;;
      'price')
        NUMBER=4
        DES='стоимости обеда'
        ;;
    esac
    _ADD
    ;;
  '-ls')
    shift
    DATE=$1
    _LS
    ;;
  '-calc')
    shift
    _CALC
    ;;
  '-avans')
    _AVANS
    ;;
esac
_EXIT 0
#-END-PROGRAM--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
