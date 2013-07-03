# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: M4rQu1Nh0S <zonadomarquinhos@gmail.com>

pkgname=xfce4-cellmodem-plugin
pkgver=0.0.5
pkgrel=2
pkgdesc="Cell Modem monitor plugin for XFCE."
groups=('xfce')
arch=(i686 x86_64)
url="http://www.xfce.org/"
depends=('xfce4-panel>=4.3.20' 'libxfcegui4>=4.3.20' 'libusb-compat' 'pciutils')
license=(GPL2)
source=('http://git.xfce.org/panel-plugins/xfce4-cellmodem-plugin/snapshot/R-0.0.5.tar.bz2'
		'xfce4-cellmodem-plugin-0.0.5-asneeded.patch'
		'xfce4-cellmodem-plugin-0.0.5-build.patch'
		'xfce4-cellmodem-plugin-0.0.5-link_for_xfce_warn.patch'
		'configure.patch'
		'makefile.patch'
		'cellmodem.patch')
md5sums=('7257f1f353c065d46c4a69245f6d51f6'
         'ac9aa699ac066fedfe95bf1067cb4d2b'
         '8f4d2220d71add6c796ec8c1ef9a7b43'
         '12ff0f0b0f99dad3387f3fece159b67a'
         'd44b3178ab31460136094a1e5be4a44a'
         '847bbef87cddcef47d91465a08bcec74'
         'b5f8137bc645b2b279a11828b2145b9f')

build() {
#->	Essentials patchs
  patch -Np0 < xfce4-cellmodem-plugin-0.0.5-asneeded.patch
  patch -Np0 < xfce4-cellmodem-plugin-0.0.5-build.patch
  patch -Np0 < xfce4-cellmodem-plugin-0.0.5-link_for_xfce_warn.patch
  patch -Np0 < configure.patch
  cd $srcdir/R-$pkgver/
  ./autogen.sh
  ./configure --prefix=/usr/ --libexecdir=/usr/lib/
#
#->	Ready-Work patchs
  cp $srcdir/cellmodem.patch $srcdir/R-0.0.5/panel-plugin/
  cp $srcdir/makefile.patch $srcdir/R-0.0.5/po/
  cd $srcdir/R-$pkgver/po/
  patch -Np0 < makefile.patch
  cd $srcdir/R-0.0.5/panel-plugin/
  patch -Np0 < cellmodem.patch 

  cd $srcdir/R-0.0.5/
  make
}

package() {
  cd $srcdir/R-$pkgver
  make DESTDIR="$pkgdir/" install
}
