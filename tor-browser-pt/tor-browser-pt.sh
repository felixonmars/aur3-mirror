#!/usr/bin/env bash
#
# Os créditos vão para:
#
# Modificado em 2014 por Felipe Facundes < felipe ponto facundes arrouba gmail ponto com >
#
# Este programa é software livre : você pode redistribuí-lo e / ou modificá-lo 
# sob os termos da GNU General Public License tal como publicada pela
# Free Software Foundation, tanto a versão 3 da licença, ou
# (A seu critério) qualquer versão posterior.
#
# Este programa é distribuído na esperança que possa ser útil,
# Mas SEM QUALQUER GARANTIA; sem mesmo a garantia implícita de
# COMERCIALIZAÇÃO ou ADEQUAÇÃO A UM DETERMINADO FIM. veja o
# GNU General Public License para mais detalhes.
#
# Você deve ter recebido uma cópia da Licença Pública Geral GNU
# Junto com este programa. Se não, veja < http://www.gnu.org/licenses/ > .

set -e

# filled by the PKGBUILD
NAME='REPL_NAME'
VERSION='REPL_VERSION'
LANGUAGE="REPL_LANGUAGE"
PKGARCH="REPL_ARCH"

ARCH=$(getconf LONG_BIT)

notify() {
  local title="$1"
  local message="$2"

  if [ $(which zenity 2>/dev/null) ]; then
    zenity --info --title "$title" --text "$message"
  elif [ $(which notify-send 2>/dev/null) ]; then
    notify-send "$title" "$message"
  elif [ $(which kdialog 2>/dev/null) ]; then
    kdialog --title "$title" --passivepopup "$message"
  else
    echo -e "$0: [$title] $message" >&2
  fi
}

update() {
	echo "$0: Extracting files to $INSTALL_DIRECTORY." >> $LOG_FILE
	rm -rf $INSTALL_DIRECTORY/*
	tar --strip-components=1 -xJf /opt/$NAME/tor-browser-linux${ARCH}-${VERSION}_${LANGUAGE}.tar.xz \
		-C $INSTALL_DIRECTORY >> $LOG_FILE 2>&1 || notify "Error" \
		"The tor-browser archive could not be extracted to your home directory. \
		\nCheck permissions of $INSTALL_DIRECTORY. \
		\nThe error log can be found in $LOG_FILE."

	[[ -f $INSTALL_DIRECTORY/start-tor-browser ]] && echo $VERSION > $VERSION_FILE
}

usage() {
  cat <<EOF
Usage: ${0##*/} [option]

Options:
  -h|--help         Show this help message and exit
  -u|--update       Force update of the copy in your home directory
  --dir=<directory> The Tor-Browser directory to use

  All unrecognized arguments will be passed to the browser,
  but arguments with spaces will break, until Tor fixes this bug:
  https://trac.torproject.org/projects/tor/ticket/12161
EOF
}

DIRECTORY=~/.$NAME
args=()
for arg; do
	case "$arg" in
		-h|--help)   usage; exit 0 ;;
		-u|--update) update=1 ;;
		--dir=*)     DIRECTORY="${arg#*=}" ;;
		*) args+=("$arg") ;;
	esac
done

INSTALL_DIRECTORY=$DIRECTORY/INSTALL
VERSION_FILE=$DIRECTORY/VERSION
LOG_FILE=$DIRECTORY/LOG

# create directory, if it is missing (e.g. first run)
[[ ! -d "$INSTALL_DIRECTORY" ]] && mkdir -p "$INSTALL_DIRECTORY"
cd "$DIRECTORY"

# create version file if missing
[[ ! -f $VERSION_FILE ]] && echo 0 > $VERSION_FILE

#get installed version
while read line
do
	INSTALLED_VERSION=$line
done < $VERSION_FILE

# start update if old or no tor-browser is installed
if [[ "$INSTALLED_VERSION" == "$VERSION" ]] && [[ $update != 1 ]]; then
	# clear log
	> $LOG_FILE
else
	echo "$0: Your version in $DIRECTORY is outdated or you do not have installed $NAME yet." > $LOG_FILE
	update
fi

# start tor-browser
cd $INSTALL_DIRECTORY && ./start-tor-browser --class Tor\ Browser "${args[@]}"
