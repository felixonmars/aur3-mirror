#!/bin/bash

# autoaur - automatically mass download, update, build and install AUR packages
# Version: 1.8
# Author Stefan Husmann <stefan-husmann@t-online.de>
# based on work of Michal Krenek (Mikos) <mikos@sg1.cz>
#
# License: GNU General Public License v.2
#          http://www.gnu.org/licenses/gpl.txt
#	Changelog:
#	1.3.2: use makepkg with options -f -s --noconfirm
#       1.4:   if =a is given in config file, a new version 
#              number can be entered.
#              optionally create a tarball from the $startdir 
#              and delete the $startdir
#       1.5: Removed support for GET_FROM_REPO, makepkg -s can do better,
#            aurdownload is called with option --nodelete now 
#            The packagename is displayed when asking for a version number
#            removed some unimplemented options
#       1.6: make autoaur-repo use the package extension in makepkg.conf
#            when adding or removing packages from the repo 
#       1.7: removed unneeded and not-working options
#       1.8: added support for customizepkg
# Basic options:
CONFIGFILE=~/.autoaur
ORIGDIR=$(pwd)
USE_COLOR=1
OPT_DOWNLOAD=1
OPT_BUILD=1
OPT_INSTALL=1
OPT_REMOVEBUILDDIR=1
OPT_REMOVE=0
OPT_CLEAN=0
. /etc/makepkg.conf

# Basic functions:
msg() {
  if [ $USE_COLOR -eq 1 ]; then
    echo -e "\033[1;32m==>\033[1;0m \033[1;1m$1\033[1;0m" >&2
  else
    echo "==> $1" >&2
  fi
}

error() {
  if [ $USE_COLOR -eq 1 ]; then
    echo -e "\033[1;31m==> ERROR:\033[1;0m \033[1;1m$1\033[1;0m" >&2
  else
    echo "==> ERROR: $1" >&2
  fi
}

collect_args() {
  REMAINING_OPTS=
  COLLECTED_ARGS=()

  while [ $# -ne 0 ]; do
    if grep -q '^--' <<< $1; then
      REMAINING_OPTS="$@"
      break
    fi
    COLLECTED_ARGS=("${COLLECTED_ARGS[@]}" "$1")
    shift
  done
}

usage() {
  cat << EOF
Usage: ${0##*/} [options] [config file]

You must have a personal repository defined in makepkg.conf. See
makepkg's manual page for further advice.

Options:
  --nodownload         Do not download packages from AUR
  --noinstall          Do not install packages from AUR
  --noupdate           Do not update package versions
  --remove             Remove conflicting packages (without dependency check)
  --clean              Clean package directories before new installation
                       (old source code will be deleted)
  --nocolor            Disable colorized output messages
  --tarball            make a tarball and delete $startdir 
  --confighelp         Help with configuration files
  -h, --help           Basic help
EOF
}

config_usage() {
  cat << EOF
Config file format example:
  $PERSREPO=my
  GET_FROM_AUR=(glproto-git=u
                glitz-cvs=u
                mesa-xgl-cvs=u
                xgl-git=u
                cairo-git=u
                libwnck-compiz=u
                compiz-quinn-cvs=u
                cgwd-cvs=u
                cgwd-themes-cvs=u
                xwinwrap-cvs=u)

a ... automatic update (with aurupdate)
c ... run customizepkg -m on the downloaded PKGBUILD
EOF
}

# Test for dependencies:
if [ ! -x "/usr/bin/aurdownload" -o ! -x "/usr/bin/aurupdate" ]; then
  error "You must have aurscripts installed!"
  error "You can get it from AUR"
  exit 1
fi

if [ ! -x "/usr/bin/sudo" ]; then
  error "You must have sudo installed and configured!"
  error "You can get it from Arch 'core' repository"
  exit 1
fi

# Parse options:
while [ $# -ne 0 ]; do
  case $1 in
    --nodownload)
      OPT_DOWNLOAD=0
      ;;
    --nobuild)
      OPT_BUILD=0
      ;;
    --noinstall)
      OPT_INSTALL=0
      ;;
    --remove)
      OPT_REMOVE=1
      ;;
    --clean)
      OPT_CLEAN=1
      ;;
    --nocolor)
      USE_COLOR=0
      ;;
    --tarball)
      BUILD_SOURCE_TARBALL=1
      ;;
    --confighelp)
      config_usage
      exit 0
      ;;
    --help | -h)
      usage
      exit 0
      ;;
    -*)
      usage
      exit 1
      ;;
    *)
      CONFIGFILE=$1
      ;;
  esac
  shift
done

# Evaluate config file:
if [ "$CONFIGFILE" ]; then
  if [ ! -f "$CONFIGFILE" ]; then
    error "Configuration file doesn't exist!"
    exit 1
  fi
  source $CONFIGFILE
fi

if [ ${#OPT_PACKAGES[@]} -ne 0 ];then
  GET_FROM_AUR=("${OPT_PACKAGES[@]}")
fi

if [ ${#GET_FROM_AUR[@]} -eq 0 ]; then
  error "You haven't specified correct config file or packages to install!"
  error "Try '${0##*/} --help' for more information."
  exit 1
fi

# Download, update, build and install packages from AUR:
for ITEM in "${GET_FROM_AUR[@]}"; do
  PACKAGE=$(echo $ITEM | cut -d "=" -f 1)
  PACKAGE_ACTION=$(echo $ITEM | cut -d "=" -f 2)

  case $PACKAGE_ACTION in
      a) echo enter version number for $PACKAGE
	  read NEW_PKGVER
	 if [ $OPT_DOWNLOAD -eq 1 ]; then
             aurdownload $PACKAGE
	     aurupdate $PACKAGE=$NEW_PKGVER
	 fi;; 
      c) if [ $OPT_DOWNLOAD -eq 1 ]; then
	  aurdownload $PACKAGE
	  pushd $PACKAGE
	  customizepkg -m > /dev/null
	  popd
	 fi;;
      *) if [ $OPT_DOWNLOAD -eq 1 ]; then
        aurdownload $PACKAGE
  	fi ;;
  esac

  cd $ORIGDIR/$PACKAGE
  msg "Building package $PACKAGE..."
  makepkg -f -s --noconfirm || exit 1
  if [ $BUILD_SOURCE_TARBALL ] ; then
      pushd ..
      tar c --remove-files -f $PACKAGE-`date +%Y%m%d`.$PKGEXT $PACKAGE
      popd
  fi
  cd $ORIGDIR

  # Remove conflicting packages:
  if [ $OPT_REMOVE -eq 1 ]; then
    msg "Removing conflicting packages..."
    msg "(conflicts: ${conflicts[*]})"
    msg "(replaces: ${replaces[*]})"
    for REMOVEPKG in "${conflicts[@]}" "${replaces[@]}"; do
      sudo pacman -Rd $REMOVEPKG
    done
  fi

  # Install package:
  if [ $OPT_INSTALL -eq 1 ]; then
    msg "Installing package $PACKAGE.."
    source $PACKAGE/PKGBUILD
    repo-remove $PKGDEST/$PERSREPO.db.tar.gz $PACKAGE    
    [ -f $PKGDEST/$pkgname-$pkgver-$pkgrel-${CARCH}${PKGEXT} ] \
	&& repo-add $PKGDEST/$PERSREPO.db.tar.gz \
	$PKGDEST/$pkgname-$pkgver-$pkgrel-${CARCH}${PKGEXT} 
    [ -f $PKGDEST/$pkgname-$pkgver-$pkgrel-any${PKGEXT} ] \
	&& repo-add $PKGDEST/$PERSREPO.db.tar.gz \
	$PKGDEST/$pkgname-$pkgver-$pkgrel-any${PKGEXT}
    sudo pacman -Sy --noconfirm $PACKAGE
    sudo pacman -Sy --noconfirm $PACKAGE
  fi
done
