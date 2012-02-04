#!/bin/bash

msg() {
  echo ""
  echo -e "   \033[1;34m->\033[1;0m \033[1;1m${1}\033[1;0m" >&2
}

error() {
  echo -e "\033[1;31m==> ERROR:\033[1;0m \033[1;1m$1\033[1;0m" >&2
}

CONF=/etc/pacget.conf
STATS=/etc/pacget.stats
ARIA2=$(which aria2c 2> /dev/null)

# ----- do some checks first -----
if [ ! -x "$ARIA2" ]; then
  error "aria2c was not found or isn't executable."
  exit 1
fi

if [ $# -ne 2 ]; then
  error "Incorrect number of arguments"
  exit 1
fi

filename=$(basename $1)
server=${1%/$filename}
arch=$(grep ^Architecture /etc/pacman.conf | cut -d '=' -f2 | sed 's/ //g')
if [[ $arch = "auto" ]]; then
  arch=$(uname -m)
fi
# Determine which repo is being used
repo=$(awk -F'/' '$(NF-2)~/^(community|core|extra|testing|comunity-testing|multilib)$/{print $(NF-2)}' <<< $server)
[ -z $repo ] && repo="custom"

# For db files, or when using a custom repo (which most likely doesn't have any mirror),
# use only the URL passed by pacman; Otherwise, extract the list of servers (from the include file of the repo) to download from
url=$1
if ! [[ $filename = *.db || $repo = "custom" ]]; then
  mirrorlist=$(awk -F' *= *' '$0~"^\\["r"\\]",/Include *= */{l=$2} END{print l}' r=$repo /etc/pacman.conf)
  if [ -n mirrorlist ]; then
    num_conn=$(grep ^split $CONF | cut -d'=' -f2)
    url=$(sed -r '/^Server *= */!d; s/Server *= *//; s/\$repo'"/$repo/"'; s/\$arch'"/$arch/; s/$/\/$filename/" $mirrorlist | head -n $(($num_conn *2)) )
  fi
fi

msg "Downloading $filename"
cd /var/cache/pacman/pkg/

touch $STATS

$ARIA2 --conf-path=$CONF --max-tries=1 --max-file-not-found=5 \
  --uri-selector=adaptive --server-stat-if=$STATS --server-stat-of=$STATS \
  --allow-overwrite=true --remote-time=true --log-level=error --summary-interval=0 \
  $url --out=${filename}.pacget && [ ! -f ${filename}.pacget.aria2 ] && mv ${filename}.pacget $2 && chmod 644 $2

exit $?
