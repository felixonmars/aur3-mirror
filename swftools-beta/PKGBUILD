# $Id$
# Contributor: Dmitry Nosachev <quartz64@gmail.com>


pkgname=swftools-beta
_realpkgname=swftools
_srcname=${_realpkgname}-2011-12-15-1229
pkgver=20111215.1229
pkgrel=1
pkgdesc="A collection of SWF manipulation and creation utilities - latest development snapshot"
arch=('i686' 'x86_64')
url="http://www.swftools.org/"
license=('GPL2')
depends=('avifile' 'giflib' 'freeglut' 'lame' 't1lib' 'libjpeg' 'fontconfig')
makedepends=('bison' 'flex' 'zlib')
provides=('swftools')
conflicts=('swftools')
source=(http://www.swftools.org/${_srcname}.tar.gz)
md5sums=('ac7117d92c10fdfb5e4670673cc7ff29')

build() {
  cd ${srcdir}/${_srcname}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_srcname}
  make prefix=${pkgdir}/usr install
}
