# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=netcfg-tray-git
pkgver=20110609
pkgrel=1
pkgdesc="Tray icon for the netcfg network connection scripts"
url="https://github.com/tlatsas/netcfg-tray"
license=('BSD')
depends=('netcfg>=2.2.0b3')
makedepends=('git')
optdepends=('gksu: For a GUI password box when running netcfg-tray-helper'
            'python-notify: libnotify based notifications upon events'
            'dzen2: for notifications through dzen2')
arch=(any)
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/tlatsas/netcfg-tray.git"
_gitname="netcfg-tray"


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are now up to date."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sed -i  's/interface=netcfg.auto_interface(connection)/interface=netcfg.auto_interface(connection)\n                if interface is None:\n                  raise KeyError\n/' src/netcfg-tray.py

  msg "Creating one file"
  mkdir -p $pkgdir/usr/bin
  msg "Compilation complete"
}

package() {
  cd $_gitname-build
  msg "Moving files into place"

  if [[ "X$XDG_CONFIG_HOME" == "X" ]]; then
    XDG_CONFIG_HOME=$HOME/.config/
  fi
  msg "Creating directories"
  dist_dir="$pkgdir/usr/share/pyshared/$pkgname-$pkgver-$pkgrel"
  mkdir -p $dist_dir
  chmod -R a+x $dist_dir
  mkdir -p $pkgdir$XDG_CONFIG_HOME/netcfg-tray/
  chown $USER:$USER  $pkgdir$XDG_CONFIG_HOME/netcfg-tray/
  mkdir -p $pkgdir/usr/share/licenses/netcfg-tray/
  mkdir -p $pkgdir/usr/bin

  msg "Moving files"

  echo "#/usr/bin/env bash
python2 /usr/share/pyshared/$pkgname-$pkgver-$pkgrel/netcfg-tray.py" > netcfg-tray
  chmod a+x netcfg-tray  


  cp netcfg-tray $pkgdir/usr/bin/
  cp LICENSE $pkgdir/usr/share/licenses/netcfg-tray/
  cd src
  msg "Config file is in $XDG_CONFIG_HOME/netcfg-tray/"
  cp config $pkgdir$XDG_CONFIG_HOME/netcfg-tray/
  chown $USER:$USER  $pkgdir$XDG_CONFIG_HOME/netcfg-tray/config
  cp netcfg-tray-helper  $pkgdir/usr/bin
  cp netcfg-tray.py  $dist_dir
  cp netcfg.py  $dist_dir

  msg 'Done'
} 
