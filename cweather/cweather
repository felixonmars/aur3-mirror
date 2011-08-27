#!/bin/sh

# Author: Xiwen Cheng <x@cinaq.com>
# Description: Fetch current weather conditions from google API and print them nicely in colors

# load config
if [ -x ~/.cweatherrc ]; then
    . ~/.cweatherrc
else
    . /etc/cweatherrc
fi

# allow overrides
if [ "x$1" != "x" ]; then
    city=$1
fi
if [ "x$2" != "x" ]; then
    locale=$2
fi
if [ "x$3" != "x" ]; then
    metric=$3
fi

# sanity check
if [ -z $city ]; then
    echo ERROR: no city defined
    exit 1;
fi
if [ -z $locale ]; then
    echo ERROR: no locale defined
    exit 1;
fi
if [ -z $metric ]; then
    echo ERROR: no metric defined
    exit 1;
fi

# fetch
curl -s -A 'Mozilla/4.0'  'http://www.google.com/ig/api?weather='$city'&hl='$locale > $file

# parse
city=`xml sel -t -c "xml_api_reply/weather/forecast_information/city" $file | awk -F\" '{print $(NF-1)}'`
condition=`xml sel -t -c "xml_api_reply/weather/current_conditions/condition" $file | awk -F\" '{print $(NF-1)}'`

if [ $metric = "C" ]; then
    temp=`xml sel -t -c "xml_api_reply/weather/current_conditions/temp_c" $file | awk -F\" '{print $(NF-1)}'`
else
    temp=`xml sel -t -c "xml_api_reply/weather/current_conditions/temp_f" $file | awk -F\" '{print $(NF-1)}'`
fi

wind=`xml sel -t -c "xml_api_reply/weather/current_conditions/wind_condition" $file | awk -F\" '{print $(NF-1)}'`
humidity=`xml sel -t -c "xml_api_reply/weather/current_conditions/humidity" $file | awk -F\" '{print $(NF-1)}'`

# cleanup
#rm $file

# data gathered, now print them; with colors =]
echo -e "\E[0;33m$city, \E[0;33m${temp}\E[m\xc2\xb0${metric}"
echo -e "\E[0;33m$condition\E[m"
echo -e "\E[0;34m$wind\E[m"
echo -e "\E[0;34m$humidity\E[m"

