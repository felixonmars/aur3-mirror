# Maintainer: Chris Finlay <cfinlay@nrcan.gc.ca>
pkgname=tricycle
pkgver=0.2.8
pkgrel=2
pkgdesc="TRiCYCLE is a standalone desktop application for converting between any one of 25 different dendro data file formats."
arch=("any")
url="http://www.tridas.org/tricycle/"
license=('GPLv2')
depends=('jre7-openjdk')
makedepends=('deb2targz')
source=("http://www.tridas.org/download/${pkgname}_${pkgver}.deb")
md5sums=('6f7d1c89f30ac62a9fa9125fcbb621ba')

package() {
	cd "$srcdir"
  deb2targz ${pkgname}_${pkgver}.deb
  tar -zxf ${pkgname}_${pkgver}.tar.gz
  cp -R "$srcdir/usr/" "$pkgdir" 
}
