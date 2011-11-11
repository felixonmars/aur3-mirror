if [ -s /etc/rc.conf ]; then
	LANG=$(. /etc/rc.conf 2> /dev/null ; echo "${TIMEZONE:=Canada/Pacific}")
fi

echo "$TIMEZONE" > /etc/timezone
