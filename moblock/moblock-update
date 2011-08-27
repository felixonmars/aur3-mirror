#!/bin/bash

. /etc/moblock/config

CONF_DIR=/etc/moblock
TEMP_DIR=$(/usr/bin/mktemp -t -d moblock-updateXXXXXXXX)
LIST_FILE=banned.list

USECOLOR="no"
. /etc/rc.d/functions
PREFIX_REG=" >"
PREFIX_HL="::"

function extract()
{
    /usr/bin/find $TEMP_DIR -type f -name '*.gz' -o -name '*.zip' |\
    while read N
    do
        case "$N" in
            *.zip)  /usr/bin/unzip -oqq "$N" 2>/dev/null
                    if [ $? -gt 0 ]; then
                        rm -f "$N"
                        return 1
                    else
                        rm -f "$N"
                    fi
                    ;;
            *.gz)   /bin/gunzip -f "$N" 2>/dev/null
                    if [ $? -gt 0 ]; then
                        rm -f "$N"
                        return 1
                    fi
                    ;;
            *)      continue
                    ;;
        esac
    done
    return 0
}

cd $TEMP_DIR

printf "${C_SEPARATOR}   ------------------------------\n"
printhl "Downloading and extracting files:\n"

# Bluetack lists (with fallback)
for i in ${BLUETACK[@]}
do
    if [ $(echo $i | /bin/grep '^[^\!]' | /usr/bin/wc -l) -eq 1 ]; then
        stat_busy "BLUETACK '${i}'... " 
        /usr/bin/wget ${WGET_OPTS} "http://www.bluetack.co.uk/config/${i}.gz" && extract
        if [ $? -gt 0 ] || [ ! -f ${i} ]; then
            stat_fail
            bfile=$i
            if [ "$bfile" = "ads-trackers-and-bad-pr0n" ]; then
                bfile="ads"
            elif [ "$bfile" = "Microsoft" ];then
                bfile="microsoft"
            fi
            stat_busy "[!!] BLUETACK '${i}' (fallback link)... "
            /usr/bin/wget ${WGET_OPTS} "http://list.iblocklist.com/?list=bt_${bfile%%-*}" -O "${i}.gz" && extract
            if [ $? -gt 0 ]; then
                stat_fail
            else
                stat_done
            fi
        else
            stat_done
        fi
    fi
done

# Blocklist lists
for i in ${BLOCKLIST[@]}
do
    if [ $(echo $i | /bin/grep '^[^\!]' | /usr/bin/wc -l) -eq 1 ]; then
        stat_busy "BLOCKLIST '${i}'... "
        /usr/bin/wget ${WGET_OPTS} "blocklist.org/${i}.p2b.gz" && extract
        if [ $? -gt 0 ]; then
            stat_fail
        else
            stat_done
        fi
    fi
done

# Old phoenixlabs.org lists
for i in ${PHOENIXLABS[@]}
do
    if [ $(echo $i | /bin/grep '^[^\!]' | /usr/bin/wc -l) -eq 1 ]; then
        stat_busy "PHOENIXLABS '${i}'... "
        /usr/bin/wget ${WGET_OPTS} "fox.phoenixlabs.org/${i}" && extract
        if [ $? -gt 0 ]; then
            stat_fail
        else
            stat_done
        fi
    fi
done

if [ $(/bin/cat "$TEMP_DIR"/* | /usr/bin/wc -l) -eq 0 ]; then
    printf "\n"
    printhl "ERROR: No files were downloaded"
    printf "${C_SEPARATOR}   ------------------------------\n"
    exit 1
fi

# Check files
printsep
printhl "Checking integrity of downloaded files:\n"

/usr/bin/find -type f | while read N
do
    stat_busy "File '$(echo $N | /bin/awk -F/ '{print $NF}')'... "
    scan1=$(/bin/cat "$N" | /usr/bin/wc -l)
    scan2=$(/bin/egrep -o ":[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*-[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" "$N" | /usr/bin/wc -l)
    if [ $scan1 -eq $scan2 ]; then
        stat_done
    else
        if [ $scan2 -gt 0 ]; then
            if [ $scan1 -gt $scan2 ]; then
                stat_append "$(($scan1-$scan2)) of $scan1 entries failed validation; keeping the file"
                stat_done
            fi
        else
            stat_fail
            stat_busy "[!!] Removing corrupted file... "
            rm "$N" 2>/dev/null
            if [ $? -gt 0 ]; then
                stat_fail
                exit 1
            else
                stat_done
            fi
        fi
    fi
done

printsep
printhl "Saving the list:\n"

# Make backup
if [ "$BACKUP_OLD_LIST" = "yes" ] && [ -f "$CONF_DIR"/"$LIST_FILE" ]; then
    stat_busy "Backing up old list to '$CONF_DIR/$LIST_FILE.gz'... "
    /bin/gzip -f "$CONF_DIR"/"$LIST_FILE" 2>/dev/null
    if [ $? -gt 0 ]; then
        stat_fail
    else
        stat_done
    fi
fi

# Save the list
stat_busy "Saving new list to '$CONF_DIR/$LIST_FILE'... "
/bin/cat "$TEMP_DIR"/* > "$CONF_DIR"/"$LIST_FILE" 2>&1
if [ $? -gt 0 ]; then
    stat_fail
    exit 1
else
    stat_done
    printf "\n"
    printhl "Saved `cat "$CONF_DIR"/"$LIST_FILE" | wc -l` ranges"
    printf "${C_SEPARATOR}   ------------------------------\n"
fi

rm -rf "$TEMP_DIR"

# Restart MoBlock
if [ -f /var/run/moblock.pid ]; then
    /bin/kill -HUP `cat /var/run/moblock.pid` >/dev/null 2>&1
fi

exit 0

