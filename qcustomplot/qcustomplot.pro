QT += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport

DEFINES += QCUSTOMPLOT_COMPILE_LIBRARY
TEMPLATE = lib
CONFIG += shared release build_all
VERSION = 1.2.1

TARGET = qcustomplot

QMAKE_TARGET_PRODUCT = "QCustomPlot"
QMAKE_TARGET_DESCRIPTION = "Plotting library for Qt"
QMAKE_TARGET_COMPANY = "www.qcustomplot.com"
QMAKE_TARGET_COPYRIGHT = "Copyright (C) by Emanuel Eichhammer"

SOURCES += qcustomplot.cpp
HEADERS += qcustomplot.h

isEmpty(PREFIX) {
    PREFIX = /usr/local
}

target.path = $$PREFIX/lib

headers.path = $$PREFIX/include/QCustomPlot
headers.files = qcustomplot.h

INSTALLS += target headers