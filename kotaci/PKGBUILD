# Contributor: H.Gokhan SARI <hsa2@difuzyon.net>
pkgname=kotaci
pkgver=0.6
pkgrel=1
pkgdesc="A tray icon that shows monthly download for turk telekom adsl"
arch=(i686)
url="http://code.google.com/p/kotaci/"
license=('GPL')
depends=('qt')
makedepends=('qt')
source=('http://kotaci.googlecode.com/files/kotaci-0.6.tar.bz2'
	'kotaci.desktop'
	'kotaci.png')
md5sums=('f8fdc5c3a505d91e53896447b9d70de7'
	'43ed3484e43b5f2c1e19a0ac07be1538'
	'c58d03975dcbbe004bd2b90f9d2376d7')

build() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/{pixmaps,applications}
  cd $srcdir/$pkgname-$pkgver
  qmake
  make || return 1
  install -m755 $srcdir/$pkgname-$pkgver/bin/kotaci $pkgdir/usr/bin
  install -m644 $startdir/kotaci.png $pkgdir/usr/share/pixmaps/
  install -m755 $startdir/kotaci.desktop $pkgdir/usr/share/applications/
}