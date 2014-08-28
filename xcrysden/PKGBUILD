# Maintainer: Vit <vitruss@gmail.com>

pkgname=xcrysden
pkgver=1.5.60
pkgrel=1
pkgdesc="crystalline and molecular structure visualisation program (shared binary x86_64 version)"
arch=('x86_64')
url="http://www.xcrysden.org/"
license=('GPLv2')

source=(http://www.xcrysden.org/download/xcrysden-${pkgver}-linux_${CARCH}-shared.tar.gz)
depends=('tk' 'tcl')
md5sums=('a749d5c5b74a702ed0c91a1444e10258')

build() {
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/opt
  ln -s /usr/lib/libtk8.6.so ${pkgdir}/usr/lib/libtk8.5.so
  ln -s /usr/lib/libtcl8.6.so ${pkgdir}/usr/lib/libtcl8.5.so
  cp -r ${srcdir}/xcrysden-${pkgver}-bin-shared ${pkgdir}/opt
}

