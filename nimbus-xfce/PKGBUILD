# Maintainer: Andrei Pall <andreipall@yahoo.com>

pkgname=nimbus-xfce
pkgver=0.1.7
pkgrel=1
pkgdesc="Nimbus Gtk engine and theme"
arch=(i686 x86_64)
url="http://www.sun.com/software/javadesktopsystem/"
license=('GPL')
groups=()
options=(!libtool)
depends=('libx11' 'gtk2' 'intltool' 'icon-naming-utils')
makedepends=('autoconf>=2.53' 'automake>=1.9' 'libtool>=1.4.3' 'intltool>=0.25' 'pkgconfig>=0.14.0' 'gnome-common')
source=(http://dlc.sun.com/osol/jds/downloads/extras/nimbus/nimbus-$pkgver.tar.bz2 \
	http://www.xfce-look.org/CONTENT/content-files/54833-Nimbus-Xfwm4.tar.bz2)
md5sums=('ecc2d3d05efab3cbe5bad0e9aeec2be8' '280fb2a23986d499575b72a8cb0bbe93')


build() {
  cd $srcdir/nimbus-$pkgver
  ./autogen.sh --prefix=/usr
  make || return 1
  make prefix=$pkgdir/usr install

  # nimbus xfwm4 theme
  cd ${srcdir}
  cp -r Nimbus-Xfwm4 ${pkgdir}/usr/share/themes || return 1
}


