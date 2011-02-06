# Maintainer: Eric Herrera <eric.gnome@gmail.com>

pkgname=nimbus
pkgver=0.1.4
pkgrel=2
pkgdesc="Nimbus Gtk engine and theme"
arch=(i686 x86_64)
url="http://www.sun.com/software/javadesktopsystem/"
license=('GPL')
groups=()
options=(!libtool)
depends=('libx11' 'gtk2' 'intltool' 'icon-naming-utils')
makedepends=('autoconf>=2.53' 'automake>=1.9' 'libtool>=1.4.3' 'intltool>=0.25' 'pkgconfig>=0.14.0' 'gnome-common')
source=(http://dlc.sun.com/osol/jds/downloads/extras/nimbus/$pkgname-$pkgver.tar.bz2)
md5sums=('329e6937577d54e64fab546b8ec7b2e6')


build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh --prefix=/usr
  make || return 1
  make prefix=$pkgdir/usr install
}


