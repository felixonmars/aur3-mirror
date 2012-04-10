#!/bin/bash
USERDB="kassir"


/etc/rc.d/postgresql restart
ps -C postgres
if [ $? -eq 0 ];then
    su postgres -c 'psql -c "select * from pg_roles"' | awk '{print $1}'| grep $USERDB
    if [ $? -ne 0 ];then
	su postgres -c 'createuser -se kassir'
    fi
    su postgres -c 'psql -l' | awk '{print $1}'| grep 'LinCash'
    if [ $? -ne 0 ];then
	su postgres -c 'createdb -e LinCash -E UTF8'
	su postgres -c 'psql -e LinCash < /usr/share/dnc/db/LinCash/create_tables.sql'
	su postgres -c 'psql -e LinCash < /usr/share/dnc/db/LinCash/insert_data.sql'
    fi
    su postgres -c 'psql -l' | awk '{print $1}'| grep 'Transaction'
    if [ $? -ne 0 ];then
	su postgres -c 'createdb -e Transaction -E UTF8'
	su postgres -c 'psql -e Transaction < /usr/share/dnc/db/Transaction/create_tables.sql'
	su postgres -c 'psql -e Transaction < /usr/share/dnc/db/Transaction/insert_data.sql'
    fi
    su postgres -c 'psql -l' | awk '{print $1}'| grep 'dnc_eds'
    if [ $? -ne 0 ];then
	su postgres -c 'createdb -e dnc_eds -E UTF8'
	su postgres -c 'psql -e dnc_eds < /usr/share/dnc/db/DiscountMobile/create_tables.sql'
	su postgres -c 'psql -e dnc_eds < /usr/share/dnc/db/DiscountMobile/insert_data.sql'
    fi
fi
exit 0
