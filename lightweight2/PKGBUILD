# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=lightweight2
pkgver=1.15
pkgrel=1
pkgdesc="Very small browser using Qt Webkit."
url="http://qt-apps.org/content/show.php/Lightweight2?content=139266"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtwebkit')
source=(http://qt-apps.org/CONTENT/content-files/139266-Lightweight2-$pkgver.tbz)
md5sums=('6172dfc80fcc37667b85186e56a11a15')

build() {
   cd $srcdir/Lightweight2-$pkgver

   qmake-qt4
   make
}

package() {
   cd $srcdir/Lightweight2-$pkgver
   
   # Binary
   install -Dm755 Lightweight2 $pkgdir/usr/bin/lightweight2

   # Desktop icon
   install -Dm644 lightweight2.desktop $pkgdir/usr/share/applications/lightweight2.desktop
   install -Dm644 icons/logo.png $pkgdir/usr/share/pixmaps/lightweight2.png
}