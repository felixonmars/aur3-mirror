# Maintainer: Leezii <admin@leezii.com>
# Contributor: Marcel Schneider <marcel@coopmasters.de>

pkgname=muparserx-dev-static
pkgver=2.16
pkgrel=4
_downloadver=2_1_6
_srcdirname="muparserx_v"${_downloadver}
pkgdesc="A C++ math parser library with array and string support"
arch=('i686' 'x86_64')
url="http://code.google.com/p/muparserx/"
license=('LGPL3')
depends=()
makedepends=()
#backup=
#options=( '!strip')
options=('!libtool' '!strip')
install=
source=("http://muparserx.googlecode.com/files/muparserx_v${_downloadver}.zip")
md5sums=('7811a6b8ed31b07c7fd631111b5660b3')
build() {
  cd ${srcdir}/${_srcdirname}||return 1
  make || return 1
}

package(){
  install -D -m644 ${srcdir}/${_srcdirname}/bin/libmuparserx.a 	$pkgdir/usr/lib/libmuparserx.a || return 1
  for INCLUDEFILE in ${srcdir}/${_srcdirname}/parser/*.h
  do
    install -D -m644  $INCLUDEFILE $pkgdir/usr/include/muparserx/${INCLUDEFILE##*/} ||return 1
  done
}


