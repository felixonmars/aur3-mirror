# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jon Kristian Nilsen <jokr.nilsen@gmail.com>

pkgname=dfu-util-git
pkgver=20130307
pkgrel=1
pkgdesc="dfu-util is a program that implements the Host (PC) side of the USB DFU protocol."
arch=('i686' 'x86_64')
url="http://wiki.openmoko.org/wiki/Dfu-util"
license=('GPL')
depends=('libusb')
makedepends=('git')
provides=('dfu-util')
replaces=('dfu-util-svn')

source=()
md5sums=()

_gitroot=git://git.openezx.org/dfu-util.git
_gitname=dfu-util-git

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  sed -i 's|AM_CONFIG_HEADER|AC_CONFIG_HEADER|g' configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
