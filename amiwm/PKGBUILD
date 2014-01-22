# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=amiwm
pkgver=0.21pl2
pkgrel=3
pkgdesc="An X window manager with an Amiga Workbench (R) screen look and feel"
arch=('i686' 'x86_64')
url="http://www.lysator.liu.se/~marcus/amiwm.html"
license=('custom')
depends=('libx11')
makedepends=('bison' 'flex')
source=(
    'ftp://ftp.lysator.liu.se/pub/X11/wm/amiwm/amiwm0.21pl2.tar.gz'
    'amiwmrc.patch'
)
md5sums=(
    '3a47e887777e2be2978363220cf815ef'
    'a29ad3c559974d9f2124ba363366f693'
)

build() {
 cd $srcdir/$pkgname$pkgver
 patch -p1 -i "$srcdir/amiwmrc.patch"
 ./configure --prefix=/usr && make
}

package() {
 cd $srcdir/$pkgname$pkgver
 ./configure --prefix=$pkgdir/usr && make
 make install
 install -Dm644 $srcdir/$pkgname$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
 grep -lR "$pkgdir" $pkgdir | xargs sed -i -e "s|$pkgdir||g"
}
