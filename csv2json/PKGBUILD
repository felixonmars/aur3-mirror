# Maintainer: webcarrot <admin at webcarrot dot pl>

pkgname=csv2json
pkgver=20121009
pkgrel=1
pkgdesc="Writen in C, CSV file to JSON file/string converter with utf8 support."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/webcarrot/csv2json"
makedepends=('git')

_gitroot="git://github.com/webcarrot/csv2json.git"
_gitname="csv2json"

build() {

  cd ${srcdir}
  msg "Connecting to GIT server...."
  rm -Rf ${_gitname}
  git clone ${_gitroot} ${_gitname}
  cd ${_gitname}
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  make CFLAGS="${CFLAGS}" all;
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}
