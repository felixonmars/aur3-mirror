# Maintainer: Allan McRae <allan@archlinux.org>

pkgname=gcc-melt-plugin
pkgver=0.9.2.b
_gccver=4.6
pkgrel=1
pkgdesc="Provides a lispy domain specific language to easily code GCC extensions in"
arch=('i686' 'x86_64')
url="http://gcc-melt.org/"
license=('GPL3')
depends=('gcc=4.6.2')
options=('!makeflags')
source=(http://gcc-melt.org/melt-${pkgver}-plugin-for-gcc-${_gccver}.tgz)
md5sums=('980c1a4324d29c6ad2ccdde8254d266a')

build() {
  cd $srcdir/melt-${pkgver}-plugin-for-gcc-${_gccver}
  
  # do not build documentation  (adds heavy makedepends...)
  sed -i "/all:/s# doc##" Makefile
  
  make
}

package() {
  cd $srcdir/melt-${pkgver}-plugin-for-gcc-${_gccver}
  make DESTDIR=$pkgdir install
}

