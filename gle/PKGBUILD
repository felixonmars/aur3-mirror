# Maintainer: A. S. Budden <abudden@NOSPAMgataki.co.uk>
pkgname=gle
pkgver=4.0.11
pkgrel=1
pkgdesc="Graphics Layout Engine -- text file based vector imaging application"
url="http://glx.sourceforge.net"
depends=(boost libtiff xorg bash)
source=(http://dl.sourceforge.net/sourceforge/glx/${pkgname}_${pkgver}_src.zip \
		size_positioning_patch)
md5sums=('3a83383c3a3e4997032366ee828491e1' '3130e463d053dd5aed8b56c8d8852ffb')

build() {
  cd $startdir/src/${pkgname}-${pkgver}
  patch -p0 < $startdir/src/size_positioning_patch
  mkdir -p $startdir/pkg/usr/share
  mkdir -p $startdir/pkg/usr/bin
  export BOOSTDIR=/usr/include/boost
  sed  -i '/^\t-$(RM\(DIR\)\?) $(INSTALL/s/$(INSTALL_/$(GLE_RPM_ROOT)\/\0/' Makefile.gcc
  make -f Makefile.gcc GLE_TOP=$startdir/src/${pkgname}-${pkgver}/bin || return 1
  make -f Makefile.gcc GLE_RPM_ROOT=$startdir/pkg install
  
}
