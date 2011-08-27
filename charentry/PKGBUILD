# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Filip Wojciechowski <filip at loka dot pl>

pkgname=charentry
pkgver=1.8
pkgrel=1
pkgdesc="A tool for inserting non-ascii characters into text"
arch=('i686' 'x86_64')
url="http://billposer.org/Software/CharEntry.html"
license=('GPL3')
depends=('tcl' 'tk')
optdepends=('iwidgets: for custom character charts')
source=(http://billposer.org/Software/Downloads/${pkgname^^[ce]}-$pkgver.tar.bz2)
md5sums=('8f1f5e5f8cf9af3a2b01b7e6ae72c714')

build() {
  cd $srcdir/${pkgname^^[ce]}-$pkgver
  install -m755 -D CharEntry.tcl $pkgdir/usr/bin/charentry
  install -m755 -d $pkgdir/usr/share/$pkgname/charts
  install -m644 SampleCharacterCharts/* $pkgdir/usr/share/$pkgname/charts/
  install -m644 SampleConfiguration $pkgdir/usr/share/$pkgname/SampleConfiguration
}
