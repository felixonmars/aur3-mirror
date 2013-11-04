# Maintainer: Leios <jrs0037@auburn.edu>
pkgname=fits-viewer
pkgver=5.3
pkgrel=1
pkgdesc="NASA graphical fv program for viewing and editing FITS images and tables"
arch=('x86_64' 'i686')
url="http://heasarc.gsfc.nasa.gov/ftools/fv/fv_download.html"
license=('GPL')
provides=('fv')
source=(ftp://heasarc.gsfc.nasa.gov/software/lheasoft/fv/fv53_pc_linux.tar.gz)
depends=('lib32-libx11' 'libx11')
if test "$CARCH" == x86_64; then
  depends+=(lib32-libx11)
fi
if test "$CARCH" == i686; then
  depends+=(libx11)
fi
md5sums=('3c0ed8cc5a499ae65452abc7e0993fb7')
package() {
  mkdir -p ${pkgdir}/opt/fv
  mkdir -p ${pkgdir}/usr/bin
  tar xzf fv53_pc_linux.tar.gz -C ${pkgdir}/opt/fv/
  cp ${pkgdir}/../../exec ${pkgdir}/usr/bin/fv

}
