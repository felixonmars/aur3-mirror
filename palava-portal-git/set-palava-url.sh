#!/bin/bash

# This script searches and replaces the placeholders for urls in palava-portal set on build-time

[ $EUID -ne 0 ] && echo "This script should be run as root." && exit 1

basefiles="$(grep -rlF 'CH4NGEMEBASE' /usr/share/webapps/palava-portal/)"
rtcfiles="$(grep -rlF 'CH4NGEMERTC' /usr/share/webapps/palava-portal/)"
stunfiles="$(grep -rlF 'CH4NGEMESTUN' /usr/share/webapps/palava-portal/)"

read -p "Please enter the base-url for your palava installation: " baseurl
read -p "Please enter the rtc-url for your palava installation: (${baseurl}) " rtcurl
read -p "Please enter the stun-url for your palava installation: (${baseurl}) " stunurl

echo "replacing base-url with ${baseurl} ..."
sed -i "s/CH4NGEMEBASE/${baseurl}/g" $(tr '\n' ' ' <<<"${basefiles}")
echo "replacing rtc-url with ${rtcurl:-${baseurl}} ..."
sed -i "s/CH4NGEMERTC/${rtcurl:-${baseurl}}/g" $(tr '\n' ' ' <<<"${rtcfiles}")
echo "replacing stun-url with ${stun:-${baseurl}} ..."
sed -i "s/CH4NGEMESTUN/${stun:-${baseurl}}/g" $(tr '\n' ' ' <<<"${stunfiles}")
