# Maintainer: Ngô Trung <ndtrung4419 at gmail dot com>
#
pkgname=ibus-unikey-git
pkgver=20110825
pkgrel=1
pkgdesc="IBus module for Vietnamese Keyboard"
url="https://code.google.com/p/ibus-unikey"
arch=('x86_64' 'i686')
license=('GPL')
depends=('ibus' 'gconf')
makedepends=('cvs' 'automake' 'autoconf')
conflicts=('ibus-unikey')
provides=('ibus-unikey')

_gitroot="git://github.com/mrlequoctuan/ibus-unikey.git"
_gitname="ibus-unikey"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
	msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr --libexecdir=/usr/lib/ibus
  make
} 
package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="${pkgdir}" install
}

