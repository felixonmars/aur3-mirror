# Maintainer: Marcel Schneider <marcel@coopmasters.de>

pkgname=muparserx-static
pkgver=2.1.6
pkgrel=2
_downloadver=2_1_6
_srcdirname="muparserx_v${_downloadver}"
pkgdesc="A C++ math parser library with array and string support"
arch=('i686' 'x86_64')
url="http://code.google.com/p/muparserx/"
license=('LGPL3')
depends=()
makedepends=()
#backup=
options=( 'staticlibs' 'libtool' '!strip')
install=
source=("http://muparserx.googlecode.com/files/muparserx_v${_downloadver}.zip" 
        "v2.1.6_autotools.patch" )
md5sums=('7811a6b8ed31b07c7fd631111b5660b3'
         '97b5f8350db81780bdb08d0f2942230f')
build() {
  cd ${srcdir}/${_srcdirname}||return 1

  patch -Np1 -i ../v2.1.6_autotools.patch || return 1
  bash ./bootstrap.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}


