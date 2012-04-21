# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Eric Le Bras (eric <dot> lebras <at> gmail <dot> com)

pkgname=cnijfilter-ip90
pkgver=2.70
pkgrel=4
pkgdesc="Canon IJ Printer Driver for PIXMA IP90"
arch=('i686')
url="http://software.canon-europe.com/software/0027214.asp?model="
license=('GPL2' 'LGPL2' 'custom')
depends=('cnijfilter-common270' 'libglade' 'libxml' 'libtiff3' 'libpng12')
makedepends=('rpmextract')
source=(ftp://download.canon.jp/pub/driver/bj/linux/cnijfilter-ip90-2.70-1.i386.rpm)
md5sums=('1d6dfde1748e2ce78980aba159ee101b')

package() {
  cd ${srcdir}
  rpmextract.sh cnijfilter-ip90-${pkgver}-1.i386.rpm
  install -d ${pkgdir}/usr
  mv ${srcdir}/usr/{lib,local,share} ${pkgdir}/usr/
}
