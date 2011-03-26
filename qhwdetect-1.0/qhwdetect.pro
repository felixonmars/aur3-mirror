TEMPLATE =   app
QT +=   gui \
  core
CONFIG +=   qt \
  console \
  qtestlib \
  release \
  warn_off
DESTDIR +=   bin
OBJECTS_DIR +=   build
MOC_DIR +=   build
UI_DIR +=   build
FORMS +=   ui/dialog.ui
SOURCES +=   src/main.cpp \
  src/mainwindow.cpp
RESOURCES +=   qhwdetect.qrc
HEADERS +=   src/mainwindow.h
