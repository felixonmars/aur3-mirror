# Maintainer: Meyer S. Jacobs <meyer.jacobs[at]gmail[dot]com>
pkgname=ptpv2d
#Revision number from http://code.google.com/p/ptpv2d/source/list
pkgver=31
pkgrel=1
pkgdesc="Precision Time Protocol daemon implementing IEEE 1588 version 1, IEEE version 2, and IEEE 802.1AS PTP"
url="http://code.google.com/p/ptpv2d/"
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('subversion')
conflicts=('ptpd')
source=("ptpv2d.patch")
md5sums=('af7ae06c906f8fddacb1ae038a3f1654')

build() {
  cd "${srcdir}"
  svn checkout http://ptpv2d.googlecode.com/svn/trunk/ptpv2d-dev/application/src "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  patch -p1 -i ../ptpv2d.patch
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ptpv2d "${pkgdir}/usr/bin/ptpv2d"
}
