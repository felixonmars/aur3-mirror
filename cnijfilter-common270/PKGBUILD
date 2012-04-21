# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Eric Le Bras (eric <dot> lebras <at> gmail <dot> com)

pkgname=cnijfilter-common270
pkgver=2.70
pkgrel=4
pkgdesc="Canon IJ Printer Driver (Common package from version 2.70)"
arch=('i686')
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0900718411.html"
license=('GPL2' 'LGPL2' 'custom')
depends=('popt>=1.6' 'cups>=1.1.14' 'ghostscript>=5.50')
makedepends=('rpmextract')
conflicts=('cnijfilter-common')
source=(ftp://download.canon.jp/pub/driver/bj/linux/cnijfilter-common-2.70-1.i386.rpm)
md5sums=('1bc79b9559806c9fe25c74505af859a0')

package() {
  cd ${srcdir}
  rpmextract.sh cnijfilter-common-${pkgver}-1.i386.rpm
  install -d ${pkgdir}/usr
  mv ${srcdir}/usr/{lib,local} ${pkgdir}/usr/

  cd ${srcdir}/usr/share/doc/cnijfilter-common-${pkgver}
  install -D LICENSE-cnijfilter-${pkgver}E.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}E.txt
  install -D LICENSE-cnijfilter-${pkgver}J.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}J.txt
}
