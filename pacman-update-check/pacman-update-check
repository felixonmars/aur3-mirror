#!/bin/sh
# Author: Brendan Hide (http://swiftspirit.co.za/)
# Copyright: (c) Brendan Hide 2013, released under the GPLv3 license
#            See http://www.gnu.org/licenses/gpl-3.0.html for the License details
# Name: pacman-update-check
# Release Version: 0.2 (2013-04-06)
# TODO: lock file
# Description: Show packages available for updates, including AUR packages, courtesy package-query
#set -x
set -e
set -u

SELF=${0##*/}

RAND=$RANDOM
TMP=/tmp/$SELF.$RAND.$$

PACLIB="/var/lib/pacman/"
grep ^DBPath /etc/pacman.conf | tail -n 1 | grep . 2>&1 /dev/null && PACLIB=$(grep ^DBPath /etc/pacman.conf | tail -n 1)

rsync -a $PACLIB/* $TMP/

fakeroot pacman -Syb $TMP 2>&1 > /dev/null

package-query -QAub $TMP

rm -rf $TMP
