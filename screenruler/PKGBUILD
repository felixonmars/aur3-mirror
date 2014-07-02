# Maintainer: doorknob60 <doorknob60 at gmail dot com>

pkgname=screenruler
pkgver=2.0
pkgrel=1
pkgdesc="A simple program that measures the distance between two points on your desktop"
arch=('i686' 'x86_64')
url=(https://github.com/doorknob60/Screenruler)
license=('MIT')
depends=('gtk3')
source=('https://github.com/doorknob60/Screenruler/archive/v2.0.tar.gz' 'screenruler.desktop' 'screenruler.png')
md5sums=('72fdee94799ec3ce9ea6927496a5e081'
         '188d6d83622ba724f88ae52850f1aacc'
         'caa844ad9d6c3bf88695b271f712dea3')
build() {
cd Screenruler-$pkgver
gcc screenruler.c -Os -s `pkg-config gtk+-3.0 --cflags` `pkg-config gtk+-3.0 --libs` -lX11 -lm -o screenruler
}

package() {
install -d $pkgdir/usr/bin
install -d $pkgdir/usr/share/applications
install -d $pkgdir/usr/share/pixmaps
cp $srcdir/Screenruler-$pkgver/screenruler $pkgdir/usr/bin/
cp $srcdir/screenruler.desktop $pkgdir/usr/share/applications/
cp $srcdir/screenruler.png $pkgdir/usr/share/pixmaps/
}
