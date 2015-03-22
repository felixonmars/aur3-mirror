#!/bin/bash

# set -x

#-BASH----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-END BASH------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-VARS----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
. '/data/shells/bash/lib/start.var'
. "${LIB_DIR}/menu.var"
. "${LIB_DIR}/date.var"
#-END VARS------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-FUNCTIONS-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
. "${LIB_DIR}/start.fn"
. "${LIB_DIR}/menu.fn"
. "${LIB_DIR}/date.fn"
#-END FUNCTIONS-------------------------------------------------------------------------------------------------------------------------------------------------------------------

#-PROGRAM-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RAZD=1
while [ "${STEP}" -ne '0' ]
  do
    _MENU "Заголовок" "МЕТРО
Дела
Календарь"
    case "${STEP}" in
      1)
        RAZD=1
        while [ "${STEP}" -ne '0' ]
          do
            _MENU "${COMMENT}" "График
Вводные данные
Расчеты
Получение денег
Просмотр поступлений"
            case ${STEP} in
              1)
                RAZD=1
                while [ "${STEP}" -ne '0' ]
                  do
                    _MENU "${COMMENT}" "Добавление смены
Просмотр графика
Редактрирование смены
Удаление смены"
                    case ${STEP} in
                      1)
                        ${SHELLS_DIR}/workday.sh '-add'
                        _STOP
                        ;;
                      2)
                        _READ_DATE '-text' 'начала отображения графика' '-date' `head -1 "${RES_DIR}/workday.res" | awk -F'|' '{print $2}'`
                        START=${DATE}
                        _READ_DATE '-text' 'окончания отображения графика' '-date' `tail -1 "${RES_DIR}/workday.res" | awk -F'|' '{print $2}'`
                        ${SHELLS_DIR}/workday.sh '-ls' "${START}" "${DATE}"
                        _STOP
                        ;;
                      3)
                        _READ_DATE
                        ${SHELLS_DIR}/workday.sh '-edit' "${DATE}"
                        _STOP
                        ;;
                      4)
                        _READ_DATE
                        ${SHELLS_DIR}/workday.sh '-del' "${DATE}"
                        _STOP
                        ;;
                    esac
                  done
                . "${TMP_MENU}"
                ;;
              2)
                RAZD=1
                while [ "${STEP}" -ne '0' ]
                  do
                    _MENU "${COMMENT}" "Новая почасовая ставка
Новая стоимость обеда
Просмотр вводных данных"
                    case ${STEP} in
                      1)
                        ${SHELLS_DIR}/money.sh '-add' 'stake'
                        _STOP
                        ;;
                      2)
                        ${SHELLS_DIR}/money.sh '-add' 'price'
                        _STOP
                        ;;
                      3)
                        _READ_DATE
                        ${SHELLS_DIR}/money.sh '-ls' "${DATE}"
                        _STOP
                        ;;
                    esac
                  done
                . "${TMP_MENU}"
                ;;
              3)
                RAZD=1
                while [ "${STEP}" -ne '0' ]
                  do
                    _MENU "${COMMENT}" "Табель
Расчитать аванс
Расчетный лист"
                    case ${STEP} in
                      1)
                        _READ_DATE '-text' 'начала учетного периода' '-date' `head -1 "${RES_DIR}/workday.res" | awk -F'|' '{print $2}'`
                        START=${DATE}
                        _READ_DATE '-text' 'окончания учетного периода' '-date' `tail -1 "${RES_DIR}/workday.res" | awk -F'|' '{print $2}'`
                        ${SHELLS_DIR}/workday.sh '-tabel' "${START}" "${DATE}"
                        _STOP
                        ;;
                      2)
                        ${SHELLS_DIR}/money.sh '-avans'
                        _STOP
                        ;;
                      3)
                        ${SHELLS_DIR}/money.sh '-calc'
                        _STOP
                        ;;
                    esac
                  done
                . "${TMP_MENU}"
                ;;
              4)
                RAZD=1
                while [ "${STEP}" -ne '0' ]
                  do
                    _MENU "${COMMENT}" "Зарплата
Аванс
Отпускные
Бонус кассира
Ваучер от клиента
Ваучер от МЕТРО
Подарки
Недостача
Межрасчетные выплаты"
                    if [ "${STEP}" -ne '0' ]
                      then
                        ${SHELLS_DIR}/plus.sh '-add' "${STEP}"
                        _STOP
                    fi
                  done
                . "${TMP_MENU}"
                ;;
              5)
                _READ_DATE '-text' "начала периода" '-date' `head -1 "${RES_DIR}/plus.res" | awk -F'|' '{print $2}'`
                START=${DATE}
                _READ_DATE '-text' "окончания периода" '-date' `tail -1 "${RES_DIR}/plus.res" | awk -F'|' '{print $2}'`
                ${SHELLS_DIR}/plus.sh '-ls' "${START}" "${DATE}"
                _STOP
                ;;
            esac
          done
        . "${TMP_MENU}"
        ;;
      2)
        RAZD=1
        while [ "${STEP}" -ne '0' ]
          do
            _MENU "${COMMENT}" "Добавление
Просмотр
Удаление"
            case "${STEP}" in
              1)
                ${SHELLS_DIR}/doing.sh '-add'
                _STOP
                ;;
              2)
                RAZD=1
                while [ "${STEP}" -ne '0' ]
                  do
                    _MENU "${COMMENT}" "На завтра
По дате
По ключевым словам
Все"
                    case ${STEP} in
                      1)
                        ${SHELLS_DIR}/doing.sh '-date' "`_NEXT_DATA ${NOW_DATE}; echo ${DATE}`"
                        _STOP
                        ;;
                      2)
                        _READ_DATE
                        ${SHELLS_DIR}/doing.sh '-date' "${DATE}"
                        _STOP
                        ;;
                      3)
                        echo -n "Укажите строку для поиска: "
                        read STRING
                        [ ! -z "${STRING}" ] && ${SHELLS_DIR}/doing.sh '-words' "${STRING}"
                        _STOP
                        ;;
                      4)
                        ${SHELLS_DIR}/doing.sh '-all'
                        _STOP
                        ;;
                    esac
                  done
                . "${TMP_MENU}"
                ;;
              3)
                if [ -f "${RES_DIR}/doing.res" ]
                  then
                    RAZD=1
                    while [ "${STEP}" -ne '0' ]
                      do
                        _MENU "${COMMENT}" "`cat ${RES_DIR}/doing.res`"
                        case ${STEP} in
                          0)
                            ;;
                          *)
                            ${SHELLS_DIR}/doing.sh '-del' "${STEP}"
                            STEP=0
                            _CLEAR
                            _STOP
                            ;;
                        esac
                      done
                    . "${TMP_MENU}"
                  else 
                    ${SHELLS_DIR}/doing.sh
                    _STOP
                fi
                ;;
            esac
          done
        . "${TMP_MENU}"
        ;;
      3)
        ${SHELLS_DIR}/calendar.sh
        _STOP
        ;;
      0)
        _EXIT 0
        ;;
    esac
  done
_EXIT 1
#-END PROGRAM---------------------------------------------------------------------------------------------------------------------------------------------------------------------
