#!/bin/bash

# DO NOT MODIFY THIS FILE. MODIFY SETTINGS VIA THE CONFIGURATION FILES IN
# /etc/hostsblock/

# CHECK FOR NEEDED AND OPTIONAL UTILITIES AND PERMISSIONS
if [ `whoami` != "root" ]; then
    echo "Insufficient permissions. Run as root."
fi

for dep in gzip curl grep sed; do
    if which "$dep" &>/dev/null; then
        /bin/true
    else
        echo "Utility $dep not found. Please install. Exiting."
        exit 1
    fi
done

if which unzip &>/dev/null; then
    zip="1"
else
    echo "Dearchiver unzip not found. URLs which use this format will be skipped."
    zip="0"
fi
if which 7za &>/dev/null; then
    zip7="1"
else
    echo "Dearchiver 7za not found. URLs which use this format will be skipped."
    zip7="0"
fi

# DEFAULT SETTINGS
tmpdir="/dev/shm"
hostsfile="/etc/hosts.block"
redirecturl="127.0.0.1"
postprocess(){
    /etc/rc.d/dnsmasq restart
}
blocklists=("http://support.it-mate.co.uk/downloads/HOSTS.txt")
USECOLOR="yes"
blacklist="/etc/hostsblock/black.list"
whitelist="/etc/hostsblock/white.list"
hostshead="0"

# SOURCE COLORS FROM FUNCTIONS FILE. IF ABSENT, JUST USE ECHO.
if [ -f /etc/rc.d/functions ]; then
    . /etc/rc.d/functions
else
    stat_busy(){
        echo $@
    }
    stat_done(){
        echo "Done"
    }
fi

# READ CONFIGURATION FILE.
if [ -f /etc/hostsblock/rc.conf ]; then
    . /etc/hostsblock/rc.conf
else
    echo "Config file /etc/hostsblock/rc.conf not found. Using defaults."
fi

# BACK UP EXISTING HOSTSFILE
stat_busy "Backing up and compressing $hostsfile to $hostsfile.old.gz..."
cp "$hostsfile" "$hostsfile".old
gzip -f "$hostsfile".old
stat_done

# CREATE TEMPORARY DIRECTORY
mkdir -p "$tmpdir"/hostsblock/hosts.block.d

# INCLUDE LOCAL BLACKLIST FILE
IFS=''
for LINE in `cat "$blacklist"`; do
    echo "$redirecturl $LINE" >> $tmpdir/hostsblock/hosts.block.d/hosts.block.0
done

# DOWNLOAD BLOCKLISTS
n=1
stat_busy "Downloading and extracting blocklists..."
for url in ${blocklists[*]}; do
    echo "   $n: $url..."
    case "$url" in
        *".zip")
            if [ $zip == "1" ]; then
                mkdir "$tmpdir"/hostsblock/tmp
                curl --compressed -s -o $tmpdir/hostsblock/tmp/hosts.block.zip "$url"
                cd "$tmpdir"/hostsblock/tmp
                echo "       Extracting..."
                unzip -jq hosts.block.zip
                grep -rIh -- "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" ./* > "$tmpdir"/hostsblock/hosts.block.d/hosts.block.$n
                cd "$tmpdir"/hostsblock
                rm -r "$tmpdir"/hostsblock/tmp
            else
                echo "Dearchiver unzip not found. Skipping URL."
            fi
        ;;
        *".7z")
            if [ $zip7 == "1" ]; then
                mkdir "$tmpdir"/hostsblock/tmp
                curl -s -o "$tmpdir"/hostsblock/tmp/hosts.block.7z "$url"
                cd "$tmpdir"/hostsblock/tmp
                echo "       Extracting..."
                7za e hosts.block.7z &>/dev/null
                grep -rIh -- "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" ./* > "$tmpdir"/hostsblock/hosts.block.d/hosts.block.$n
                cd "$tmpdir"/hostsblock
                rm -r "$tmpdir"/hostsblock/tmp
            else
                echo "Dearchiver 7za not found. Skipping URL."
            fi
        ;;
        *)
            curl -s -o "$tmpdir"/hostsblock/hosts.block.d/hosts.block.$n "$url"
    esac
    let "n+=1"
done
stat_done

# GENERATE WHITELIST SED SCRIPT
cat "$whitelist" |\
    sed -e 's/.*/\/&\/d/' -e 's/\./\\./g' >> "$tmpdir"/hostsblock/whitelist.sed

# DETERMINE THE REDIRECT URL NOT BEING USED
[ $redirecturl == "127.0.0.1" ] && \
    notredirect="0.0.0.0" || \
    notredirect="127.0.0.1"

# PROCESS BLOCKLIST ENTRIES INTO TARGET FILE
stat_busy "Processing blocklist entries..."
if [ $hostshead == 0 ]; then
    rm "$hostsfile"
else
    cp -f "$hostshead" "$hostsfile"
fi
grep -Ih -- "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" "$tmpdir"/hostsblock/hosts.block.d/* |\
sed -e 's/[[:space:]][[:space:]]*/ /g' -e "s/\r//g" -e "s/\#.*//g" -e \
    "s/ $//g" -e "s|$notredirect|$redirecturl|g" | sort -u | \
    sed -f "$tmpdir"/hostsblock/whitelist.sed >> "$hostsfile"
stat_done

# REPORT COUNT OF MODIFIED OR BLOCKED URLS
totalhosts=`grep -c -- "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" "$hostsfile"`
echo "$totalhosts urls modified or blocked"

# COMMANDS TO BE EXECUTED AFTER PROCESSING
postprocess

# CLEAN UP
rm -r "$tmpdir"/hostsblock
