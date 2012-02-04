#!/bin/sh
# use this stupid script to just prepare wicd-kde
# dir with translations.
#
# 1. Update the lists of the ready (about 80%) translations
# check the situation here: http://l10n.kde.org/stats/gui/trunk-kde4/po/wicd-kde.po/
LIST="cs  da  de  en_GB  es  et  fr  it  nb  nl  pa  pt  pt_BR  ru  sv  uk  zh_CN  zh_TW"

# 2. run this script. It will create an i18n dir in wicd-kde sources ($RK_SRCS variable, set it to your source path) 
# dir with all the listed translations (eg: italian translation = wicd-kde_it.po file) 
# plus the CMakeLists.txt file needed to compile them.
RK_SRCS=/DATI/KDE/SRC/wicd-kde

# 3. Uncomment the "ADD_SUBDIRECTORY( i18n )" line in main CMakeLists.txt file.

# 4. test a package creation (to see the translations installed)

# THAT's ALL!!

########################################################################################################

# current dir
CWD=$(pwd)

# fix language
export LANG=en_US.utf8

# create the i18n dir
cd $RK_SRCS
mkdir -p i18n
cd i18n

# download the po files
for lang in $LIST
do
    wget http://websvn.kde.org/*checkout*/trunk/l10n-kde4/$lang/messages/extragear-network/wicd-kde.po
    
    if [ -a wicd-kde.po ]; then
        mv wicd-kde.po wicd-kde_$lang.po
    
        # retrieve the statistic string
        STATS=$(msgfmt --statistic wicd-kde_$lang.po 2>&1)
        rm messages.mo

        # grep out translated & untranslated strings number
        TRANS=$(echo $STATS | awk '{print $1}')
        TRANS=${TRANS:-0}
        FUZZ=$(echo $STATS | awk '{print $4}')
        FUZZ=${FUZZ:-0}
        UNTR=$(echo $STATS | awk '{print $7}')
        UNTR=${UNTR:-0}

        # check if perc is more than 80%
        TOT=$[$TRANS+$FUZZ+$UNTR]
        if [ $TOT -eq 0 ]; then
            rm wicd-kde_$lang.po
        else
            PERC=$(echo $TRANS/$TOT | bc -l)

            RESULT=$(echo $PERC '>' .80 | bc -l)
            if [ $RESULT -eq 0 ]; then 
                echo removing $lang...
                rm wicd-kde_$lang.po
            fi
        fi
    fi
done

# create the CMakeLists.txt file for the translations


echo '

FIND_PROGRAM(GETTEXT_MSGFMT_EXECUTABLE msgfmt)
 
IF(NOT GETTEXT_MSGFMT_EXECUTABLE)
        MESSAGE(
"------
                 NOTE: msgfmt not found. Translations will *not* be installed
------")
ELSE(NOT GETTEXT_MSGFMT_EXECUTABLE)
 
        SET(catalogname wicd-kde)
 
        ADD_CUSTOM_TARGET(translations ALL)
 
        FILE(GLOB PO_FILES ${catalogname}*.po)
 
        FOREACH(_poFile ${PO_FILES})
                GET_FILENAME_COMPONENT(_poFileName ${_poFile} NAME)
                STRING(REGEX REPLACE "^${catalogname}_?" "" _langCode ${_poFileName} )
                STRING(REGEX REPLACE "\\.po$" "" _langCode ${_langCode} )
 
                IF( _langCode )
                        GET_FILENAME_COMPONENT(_lang ${_poFile} NAME_WE)
                        SET(_gmoFile ${CMAKE_CURRENT_BINARY_DIR}/${_lang}.gmo)
 
                        ADD_CUSTOM_COMMAND(TARGET translations
                                COMMAND ${GETTEXT_MSGFMT_EXECUTABLE} --check -o ${_gmoFile} ${_poFile}
                                DEPENDS ${_poFile})
                        INSTALL(FILES ${_gmoFile} DESTINATION ${LOCALE_INSTALL_DIR}/${_langCode}/LC_MESSAGES/ RENAME ${catalogname}.mo)
                ENDIF( _langCode )
 
        ENDFOREACH(_poFile ${PO_FILES})
 
ENDIF(NOT GETTEXT_MSGFMT_EXECUTABLE)

' > CMakeLists.txt

# done :)
cd $CWD
echo "Done. Yuppy!"
