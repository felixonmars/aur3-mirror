# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=chessx
pkgver=1.3.2
pkgrel=1
pkgdesc="Open Source chess database."
arch=('i686' 'x86_64')
url="http://chessx.sf.net"
license=('GPL2')
depends=('desktop-file-utils' 'qt5-multimedia' 'qt5-svg')
makedepends=('qt5-tools')
install=$pkgname.install
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('01c754f395760e85b0a2689e0dfb9be3')

prepare() {
   cd $srcdir/$pkgname-$pkgver
   qmake-qt5
}

build() {
   cd $srcdir/$pkgname-$pkgver
   make
}

package() {
   cd $srcdir/$pkgname-$pkgver

   # Binary
   install -Dm755 release/chessx $pkgdir/usr/bin/chessx

   # Desktop icon
   install -Dm644 data/images/chessx.png $pkgdir/usr/share/pixmaps/chessx.png
   install -Dm644 unix/chessx.desktop $pkgdir/usr/share/applications/chessx.desktop
}