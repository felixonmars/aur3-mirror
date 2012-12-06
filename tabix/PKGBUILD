# Contributor: Stefano Barbi <stefanobarbi@gmail.com>

pkgname=tabix
pkgver=0.2.6
pkgrel=1

pkgdesc="Tabix: fast retrieval of sequence features from generic TAB-delimited files"
arch=("x86_64" "i686")
url="http://samtools.sourceforge.net/"
license=('MIT')
# depends=('perl' 'zlib')
# optdepends=('perl' 'python' 'jdk')
source=("http://downloads.sourceforge.net/samtools/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('36a61ceac2f5bed36018434282bbcc5d')
build() {
  cd $srcdir/${pkgname}-$pkgver
  make
}
package() {
  cd "$srcdir/${pkgname}-$pkgver"
  install -d ${pkgdir}/usr/bin/
  install tabix bgzip ${pkgdir}/usr/bin/
#  PREFIX="$pkgdir/usr/" make  install
}
