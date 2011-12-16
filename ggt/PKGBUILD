# Maintainer:   Andrea Agosti <cifvts at gmail dot com>
#
pkgname=ggt
pkgver=0.6.1
pkgrel=2
pkgdesc="The Generic Graphics Toolkit is a library of generic programming primitives that allow applications to be written that adapt to whatever underlying graphics system the developer is using"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ggt/"
license=('GPL')
source=("http://downloads.sourceforge.net/project/ggt/Generic%20Math%20Template%20Library/${pkgver}/gmtl-${pkgver}.zip")
md5sums=('81d104b965647af2bfb23f13f2fd6f67')
makedepends=('scons')

package() {
  cd ${srcdir}/gmtl-${pkgver}
  scons install prefix=${pkgdir}/usr
  cd ${pkgdir}/usr/include
  ln -s "./gmtl-${pkgver}/gmtl" "${pkgdir}/usr/include/gmtl"
}
