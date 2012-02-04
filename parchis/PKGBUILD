# Maintainer: perlawk

pkgname=parchis
pkgver=4.0
_pkgver=40
pkgrel=1
pkgdesc="Parchís is a very popular board-game in Spain. It can be played by up to four players.
	An applications for mgrx graphic package"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://www.fgrim.com/parchis"
depends=(mgrx)
makedepends=('')
options=()
build() {
  cd ${srcdir}/${pkgname}${_pkgver}
  if [ `uname -m` == 'x86_64' ]; then
    cp ${startdir}/patch.* .
  	patch makefile.x11 < patch.64
  fi

  
  make -j4 -f makefile.x11 || return 1

  mkdir -p $pkgdir/usr/bin
  install -m755 parchis $pkgdir/usr/bin/
}
source=( "http://www.fgrim.com/parchis/$pkgname${_pkgver}.tar.gz"
	patch.64)
md5sums=( 
0ffe4dd44b394b4ea70e490c117217ae
e1911ab8244d29056f9a23085614afcf)
