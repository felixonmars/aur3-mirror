#!/bin/sh

[-d ~/.hitchhikersguide ] || mkdir ~/.hitchhikersguide
cd ~/.hitchhikersguide

java -cp /usr/share/java/hitchhikersguide/ZPlet.jar russotto.zplet.ZJApp /usr/share/hitchhikersguide/hhgg.z3
