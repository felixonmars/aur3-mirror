#!/bin/sh


ZM_CONFIG=/etc/zm.conf



loadcfg() {
	if [ -f $ZM_CONFIG ]; then
		. $ZM_CONFIG
	else
		echo "ERROR: $ZM_CONFIG not found."
		exit 1
	fi
	}
chkmysql(){
	#FIXME
	/etc/rc.d/mysqld restart || (echo "mysql  is not availible" && exit 1 )
	}

getmylogin(){
	echo  "Enter MySQL Administrator username" 
	echo  "(Default: root and password is blank)"
	echo -n "MySQL Admin: "
	read MYADMIN
	echo -n "Password:  "
	read MYPASS
	if [ "X$MYPASS" != "X" ]; then MYPASS="-p$MYPASS"; fi
	echo "\q" |mysql -u $MYADMIN $MYPASS || exit 0 
	
	}

checkdb()
{
	# Check database exisits and version
	exists=$(echo "show databases" |mysql -u $MYADMIN "$MYPASS" |grep zm)
	if [ "$exists" = "zm" ]; then
		OLD_VERSION=$(echo "select Value from Config where Name = 'ZM_DYN_DB_VERSION';" | mysql -u $MYADMIN $MYPASS zm |grep -v '^Value')

		case $OLD_VERSION in
			"")
				echo "A zm database exists, but the version is unknown"
				echo "Updating is unlikely to succeed"
			;;
			"$ZM_VERSION")
				echo "The zm database appears to be up to date"
				echo "If this is incorrect, edit $ZM_CONFIG to reflect the current version"
			;;
			*)
				echo "A database fron zm-$OLD_VERSION exists already"
			;;
		esac

		while [ true ]
		do
			echo "Choose one of the following options:"
			echo "[U]pdate the database"
			echo "[D]rop the old database and reinitialize"
			echo "[E]xit and do nothing"
			read OPTION
			case $OPTION in
				"U"|"u")
					/etc/rc.d/zm restart
					exit 0
				;;
				"D"|"d")
				echo "drop database zm;"|mysql -u $MYADMIN $MYPASS
				return
				;;
				"E"|"e")
				exit 0
				;;
			esac
		done
	fi
}

checkcfg(){
for n in ZM_DB_HOST ZM_DB_NAME ZM_DB_USER ZM_DB_PASS; do
	eval "val=\$$n"
	if [ "$val" = "" ]; then
		echo "ERROR($ZM_CONFIG): $n should not be empty."
		echo "Enter a $n for ZM to use the Database."
			if [ "$n" = "ZM_DB_PASS" ]; then
				echo -n "Will not echo on screen $n : "
				stty -echo    # Turns off screen echo.
				read newval
				stty echo     # Restores screen echo.
				echo ""
				### The following can be used to generate a random password
				# randstr newval 16
			else
				echo -n "$n : "
				read newval
			fi
		cp $ZM_CONFIG /tmp/$$ &&
		sed 's/^'$n='.*$/'$n=$newval'/g' /tmp/$$ >$ZM_CONFIG

	fi
done

if [ "$ZM_DB_HOST" = "localhost" ]; then
	ClientHost=localhost
else
	ClientHost=`hostname`
fi
}

reloadcfg(){
loadcfg
}

initdb(){
sql=/tmp/zm.crdb.sql
echo "" >$sql
chmod 600 $sql

echo "CREATE DATABASE $ZM_DB_NAME;" >>$sql
echo "USE $ZM_DB_NAME;" >>$sql

echo "GRANT all on $ZM_DB_NAME.* TO '$ZM_DB_USER'@'$ClientHost' IDENTIFIED BY '$ZM_DB_PASS';" >>$sql

cat $sql | mysql -B -h $ZM_DB_HOST -u $MYADMIN $MYPASS
rm -f $sql

cat $ZM_PATH_UPDATE/zm_create.sql | mysql -h $ZM_DB_HOST -u $ZM_DB_USER -p$ZM_DB_PASS $ZM_DB_NAME
( cd $ZM_PATH_UPDATE; perl $ZM_PATH_BIN/zmupdate.pl -f )

 $ZM_PATH_UPDATE/customdb $ZM_DB_HOST $ZM_DB_NAME $ZM_DB_USER $ZM_DB_PASS
}



loadcfg
getmylogin
checkdb
checkcfg
reloadcfg
initdb




