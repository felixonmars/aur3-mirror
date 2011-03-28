# Maintainer:  Andrzej Giniewicz <gginiu@gmail.com>

pkgname=input-wacom-git
pkgver=20110328
pkgrel=1
pkgdesc="Kernel driver for Wacom tablets - development version"
arch=('i686' 'x86_64')
url="http://linuxwacom.sourceforge.net/"
license=('GPL')
depends=('kernel26>=2.6.26')
makedepends=('git' 'kernel26-headers')
provides=('input-wacom' 'input-wacom-cvs')
conflicts=('input-wacom' 'input-wacom-cvs')
replaces=('input-wacom-cvs')
options=('!libtool')

_gitroot="git://linuxwacom.git.sourceforge.net/gitroot/linuxwacom/input-wacom"
_gitname="input-wacom"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  make
  cd inputattach
  gcc inputattach.c -o inputattach
}

package() {
  cd "${srcdir}/$_gitname-build"
  _ver=`uname -r | sed 's/[0-9]*\.[0-9]*\.\([0-9]*\).*/\1/'`
  if test $_ver -ge 36
  then
    _ver=2.6.36
  else
    _ver=2.6.30
  fi
  install -D -m 644 $_ver/wacom.ko "${pkgdir}"/lib/modules/$(uname -r)/updates/wacom.ko
  install -D -m 644 $_ver/wacom_w8001.ko "${pkgdir}"/lib/modules/$(uname -r)/updates/wacom_w8001.ko
  install -D -m 755 inputattach/inputattach "${pkgdir}"/usr/bin/inputattach
}

