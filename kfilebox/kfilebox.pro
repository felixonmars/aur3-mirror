# -------------------------------------------------
# Project created by QtCreator 2010-01-28T13:45:03
# -------------------------------------------------


QT += sql network dbus
LIBS += -lkdeui -lkdecore
TARGET = bin/kfilebox
TEMPLATE = app
SOURCES += main.cpp \
    src/dropboxclient.cpp \
    src/dropboxclientadaptor.cpp \
    src/notification.cpp \
    src/configuration.cpp \
    src/configurationdbdriver.cpp \
    src/installerform.cpp \
    src/mainwindow.cpp
HEADERS += \
    src/dropboxclient.h \
    src/dropboxclientadaptor.h \
    src/notification.h \
    src/configuration.h \
    src/configurationdbdriver.h \
    src/installerform.h \
    src/mainwindow.h
RESOURCES += DropboxIcons.qrc

FORMS += \
    src/installerform.ui \
    src/mainwindow.ui

TRANSLIST = ar\
    br \
    cs \
    de \
    el \
    en \
    es \
    fr \
    gl \
    it \
    lt \
    nl \
    pl \
    ru \
    si \
    tr \
    tw \
    zh

for(language, TRANSLIST):TRANSLATIONS += locale/$${language}/kfilebox.po
FORMS +=
!isEmpty(TRANSLATIONS) {
    isEmpty(QMAKE_LRELEASE) {
        win32:QMAKE_LRELEASE = msgfmt.exe
        else:QMAKE_LRELEASE = msgfmt
    }
    TSQM.name = msgfmt \
        ${QMAKE_FILE_IN}
    TSQM.input = TRANSLATIONS
    TSQM.output = ${QMAKE_FILE_PATH}/${QMAKE_FILE_BASE}.mo
    TSQM.commands = $$QMAKE_LRELEASE \
        -o \
        $$TSQM.output \
        ${QMAKE_FILE_IN}
    TSQM.CONFIG = no_link
    QMAKE_EXTRA_COMPILERS += TSQM
    PRE_TARGETDEPS += compiler_TSQM_make_all
}
else:message(No translation files in project)


DATADIR=/usr/share

QMFILES = bin/kfilebox
target.path = /usr/bin/
target.files = $$QMFILES
INSTALLS += target
INSTALL_DESKTOP = kfilebox.desktop
insdesktop.path = $$DATADIR/applications/
insdesktop.files = $$INSTALL_DESKTOP
INSTALLS += insdesktop
INSTALL_AUTOSTART = kfilebox.desktop
insauto.path = $$DATADIR/autostart
insauto.files = $$INSTALL_AUTOSTART
INSTALLS += insauto
INSTALL_NOTIFY = kfilebox.notifyrc
insnotify.path = $$DATADIR/kde4/apps/kfilebox
insnotify.files = $$INSTALL_NOTIFY
INSTALLS += insnotify

iconAPP.path = $$DATADIR/kfilebox
iconAPP.files += img/kfilebox.png
INSTALLS += iconAPP

icon16.path = $$DATADIR/icons/hicolor/16x16/apps
icon16.files += img/hicolor/16x16/apps/kfilebox.png
INSTALLS += icon16
icon22.path = $$DATADIR/icons/hicolor/22x22/apps
icon22.files += img/hicolor/22x22/apps/kfilebox.png
INSTALLS += icon22
icon24.path = $$DATADIR/icons/hicolor/24x24/apps
icon24.files += img/hicolor/24x24/apps/kfilebox.png
INSTALLS += icon24
icon32.path = $$DATADIR/icons/hicolor/32x32/apps
icon32.files += img/hicolor/32x32/apps/kfilebox.png
INSTALLS += icon32
icon48.path = $$DATADIR/icons/hicolor/48x48/apps
icon48.files += img/hicolor/48x48/apps/kfilebox.png
INSTALLS += icon48
icon64.path = $$DATADIR/icons/hicolor/64x64/apps
icon64.files += img/hicolor/64x64/apps/kfilebox.png
INSTALLS += icon64
icon128.path = $$DATADIR/icons/hicolor/128x128/apps
icon128.files += img/hicolor/128x128/apps/kfilebox.png
INSTALLS += icon128
iconox16.path = $$DATADIR/icons/oxygen/16x16/apps
iconox16.files += img/hicolor/16x16/apps/kfilebox.png
INSTALLS += iconox16
iconox22.path = $$DATADIR/icons/oxygen/22x22/apps
iconox22.files += img/hicolor/22x22/apps/kfilebox.png
INSTALLS += iconox22
iconox24.path = $$DATADIR/icons/oxygen/24x24/apps
iconox24.files += img/hicolor/24x24/apps/kfilebox.png
INSTALLS += iconox24
iconox32.path = $$DATADIR/icons/oxygen/32x32/apps
iconox32.files += img/hicolor/32x32/apps/kfilebox.png
INSTALLS += iconox32
iconox48.path = $$DATADIR/icons/oxygen/48x48/apps
iconox48.files += img/hicolor/48x48/apps/kfilebox.png
INSTALLS += iconox48
iconox64.path = $$DATADIR/icons/oxygen/64x64/apps
iconox64.files += img/hicolor/64x64/apps/kfilebox.png
INSTALLS += iconox64
iconox128.path = $$DATADIR/icons/oxygen/128x128/apps
iconox128.files += img/hicolor/128x128/apps/kfilebox.png
INSTALLS += iconox128

transinstallar.path = $$DATADIR/locale/ar/LC_MESSAGES
transinstallar.files = locale/ar/kfilebox.mo
INSTALLS += transinstallar
transinstallbr.path = $$DATADIR/locale/br/LC_MESSAGES
transinstallbr.files = locale/br/kfilebox.mo
INSTALLS += transinstallbr
transinstallde.path = $$DATADIR/locale/de_DE/LC_MESSAGES
transinstallde.files = locale/de/kfilebox.mo
INSTALLS += transinstallde
transinstallel.path = $$DATADIR/locale/el/LC_MESSAGES
transinstallel.files = locale/el/kfilebox.mo
INSTALLS += transinstallel
transinstallen.path = $$DATADIR/locale/en/LC_MESSAGES
transinstallen.files = locale/en/kfilebox.mo
INSTALLS += transinstallen
transinstallen_gb.path = $$DATADIR/locale/en_GB/LC_MESSAGES
transinstallen_gb.files = locale/en/kfilebox.mo
INSTALLS += transinstallen_gb
transinstalles.path = $$DATADIR/locale/es/LC_MESSAGES
transinstalles.files = locale/es/kfilebox.mo
INSTALLS += transinstalles
transinstallfr.path = $$DATADIR/locale/fr/LC_MESSAGES
transinstallfr.files = locale/fr/kfilebox.mo
INSTALLS += transinstallfr
transinstallgl.path = $$DATADIR/locale/gl/LC_MESSAGES
transinstallgl.files = locale/gl/kfilebox.mo
INSTALLS += transinstallbr
transinstalltr.path = $$DATADIR/locale/tr/LC_MESSAGES
transinstalltr.files = locale/tr/kfilebox.mo
INSTALLS += transinstalltr
transinstallru.path = $$DATADIR/locale/ru/LC_MESSAGES
transinstallru.files = locale/ru/kfilebox.mo
INSTALLS += transinstallru
transinstallcs.path = $$DATADIR/locale/cs/LC_MESSAGES
transinstallcs.files = locale/cs/kfilebox.mo
INSTALLS += transinstallcs
transinstallpl.path = $$DATADIR/locale/pl/LC_MESSAGES
transinstallpl.files = locale/pl/kfilebox.mo
INSTALLS += transinstallpl
transinstallit.path = $$DATADIR/locale/it/LC_MESSAGES
transinstallit.files = locale/it/kfilebox.mo
INSTALLS += transinstallit
transinstalllt.path = $$DATADIR/locale/lt/LC_MESSAGES
transinstalllt.files = locale/lt/kfilebox.mo
INSTALLS += transinstalllt
transinstallnl.path = $$DATADIR/locale/nl/LC_MESSAGES
transinstallnl.files = locale/nl/kfilebox.mo
INSTALLS += transinstallnl
transinstallsi.path = $$DATADIR/locale/si/LC_MESSAGES
transinstallsi.files = locale/si/kfilebox.mo
INSTALLS += transinstallsi
transinstallzh.path = $$DATADIR/locale/zh/LC_MESSAGES
transinstallzh.files = locale/zh/kfilebox.mo
INSTALLS += transinstallzh
transinstallzh_cn.path = $$DATADIR/locale/zh_cn/LC_MESSAGES
transinstallzh_cn.files = locale/zh/kfilebox.mo
INSTALLS += transinstallzh_cn
transinstallzh_tw.path = $$DATADIR/locale/zh_tw/LC_MESSAGES
transinstallzh_tw.files = locale/tw/kfilebox.mo
INSTALLS += transinstallzh_tw
