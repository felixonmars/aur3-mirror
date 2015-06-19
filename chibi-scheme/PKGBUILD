# Contributor: kaptoxic at yahoo com
# pkgbuild by peter feigl <peter.feigl@jku.at>
pkgname=chibi-scheme
pkgver=0.7.3
pkgrel=1
pkgdesc="Small Footprint Scheme for use as a C Extension Language"
arch=('i686' 'x86_64')
url="http://synthcode.com/wiki/chibi-scheme"
license=('BSD-like')
conflicts=(chibi-scheme-hg)
depends=(glibc)
source=(http://synthcode.com/scheme/chibi/${pkgname}-${pkgver}.tgz)
md5sums=('859753dc88d0a7388f0b62859cd3064b')

build()
{
  cd ${srcdir}/${pkgname}-${pkgver}
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/etc/ make PREFIX=/usr DESTDIR=${pkgdir}
}

package()
{
  cd ${srcdir}/${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR=${pkgdir} install
}
