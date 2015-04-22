# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=freechartgeany
pkgver=2.0.0
pkgrel=1
pkgdesc="Free Chart Geany is a software solution for market technical analysis and charting."
arch=('i686' 'x86_64')
url="http://freechartgeany.sourceforge.net/"
license=('GPL2')
depends=('qtwebkit')
source=(http://sourceforge.net/projects/$pkgname/files/v2/$pkgname-$pkgver.tar.gz)
md5sums=('932a84321c9adf63e725fcc4188c9217')

prepare() {
   cd $srcdir/$pkgname-$pkgver
   qmake-qt4
}

build() {
   cd $srcdir/$pkgname-$pkgver
   make
}

package() {
   cd $srcdir/$pkgname-$pkgver

   # Executable
   install -Dm755 FreeChartGeany $pkgdir/usr/bin/FreeChartGeany   

   # Desktop icon
   install -Dm644 images/icons/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
   install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}