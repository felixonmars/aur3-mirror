# Maintainer: Roberto Vanto <r.vanto@gmail.com>

pkgname=fprint_demo-nightly
pkgver=20080319
_pkgrev=5d86c3f7
pkgrel=1
pkgdesc="Simple GTK+ application to demonstrate and test libfprint's capabilities"
arch=('i686' 'x86_64')
url="http://reactivated.net/fprint/wiki/Main_Page"
license=('LGPL')
groups=('fprint')
depends=('libfprint-nightly')
source=(http://projects.reactivated.net/snapshots/fprint_demo/fprint_demo-$pkgver-$_pkgrev.tar.bz2)
md5sums=('95a99e6a18999d28d00e12f69fc846d5')

build() {
  cd $startdir/src/fprint_demo-$pkgver-$_pkgrev
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
