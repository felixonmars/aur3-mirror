# Maintainer: perlawk

pkgname=gchart
pkgver=1.0
_pkgver=10
pkgrel=2
pkgdesc="An addon for mgrx graphic package"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://www.fgrim.com/mgrx"
depends=('mgrx')
makedepends=('')
options=()
build() {
  cd ${srcdir}/${pkgname}${_pkgver}
  if [ `uname -m` == 'x86_64' ]; then
    cp ${startdir}/makefile.64 Makefile 
  else
    cp ${startdir}/makefile.32 Makefile 
  fi
  
  make -j4 || return 1

  mkdir -p $pkgdir/usr/{lib,include}
  install -m755 libgrchartX* $pkgdir/usr/lib/
  install -m755 *h $pkgdir/usr/include/
}
source=( "http://www.fgrim.com/mgrx/$pkgname${_pkgver}.zip"
	makefile.32 makefile.64)
md5sums=( 
e097f8c88402c39279ee884a64da7ba4 
a592e6cd593dd2c408ed3e1b01a4c5a0
1b010ea80a0f33b4ddabf77beb3a2316)
