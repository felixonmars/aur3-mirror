# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=amiwm
pkgver=0.21pl2
pkgrel=1
pkgdesc="An X window manager with an Amiga Workbench (R) screen look and feel"
arch=('i686' 'x86_64')
url="http://www.lysator.liu.se/~marcus/amiwm.html"
license=('custom')
depends=('libx11')
source=('ftp://ftp.lysator.liu.se/pub/X11/wm/amiwm/amiwm0.21pl2.tar.gz')
md5sums=('3a47e887777e2be2978363220cf815ef')


build() {
 cd $srcdir
 rm -rf $srcdir/build
 cp -ar $srcdir/$pkgname$pkgver $srcdir/build
 cd $srcdir/build
 ./configure --prefix=$pkgdir/usr
 make
}

package() {
 cd $srcdir/build
 make install
 install -Dm644 $srcdir/build/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
