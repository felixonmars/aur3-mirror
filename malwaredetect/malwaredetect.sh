#!/bin/bash
[ ! -f "${1}" ] && echo "Invalid or missing input file." && exit 1
POSTDATA=$(sha256sum "$1" | cut -d" " -f1)
URL="http://www.virustotal.com/search.html"
DETECTIONRATE=$(curl --silent --show-error --max-redirs 1 -L "${URL}" -d "chain=${POSTDATA}" | grep "status-total" | sed "s/^.*(\(.*%\)).*$/\1/")
REPORT="YES"
[ "${DETECTIONRATE}" == "0.0%" ] && REPORT="NO" && zenity --info --text "File ${1} is clean according to VirusTotal."
[ "${DETECTIONRATE}" == "" ] && REPORT="NO" && zenity --info --text "File ${1} is unknown to VirusTotal, or a network error occured."
[ "${REPORT}" == "YES" ] && zenity --warning --text "MALWARE !!! File ${1} is malware. VirusTotal detection rate: ${DETECTIONRATE}"

