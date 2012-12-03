#!/bin/sh

[ -f /etc/conf.d/mldonkey ] && . /etc/conf.d/mldonkey

MLDUSER=${MLDUSER:-`whoami`}

case "$1" in
    start)
        echo "Starting MLDonkey..."

	if [ "$MLDUSER" == "$(whoami)" ]; then
		mlnet &
	else
		su $MLDUSER -c "mlnet &"
	fi

	if [ $? -gt 0 ]; then
            echo "Starting MLDonkey fail!"
        else
            echo "Starting MLDonkey done."
        fi

        ;;

    stop)
        echo "Stopping MLDonkey..."
	pkill mlnet

        if [ $? -gt 0 ]; then
            echo "Stopping MLDonkey fail!"
        else
            echo "Stopping MLDonkey done."
        fi
        ;;

    restart)
        $0 stop
	sleep 1
        $0 start
        ;;

    *)
        echo "usage: $0 {start|stop|restart}"
	;;
esac
exit 0

