# PKGBUILD
# Author: jdeb
# Modified: 2011-05-30

pkgname='mixtray'
pkgver='1.0.0'
pkgrel=1
pkgdesc='Tray icon for Alsa mixer control (Qt)'
arch=('i686' 'x86_64')
url='https://github.com/jdeb/mixtray'
optdepends=()
license=('GPL3')
depends=('qt')
source=("$url/tarball/master/jdeb-$pkgname-$pkgver-$pkgrel.tar.gz")
md5sums=('d4d230a989c8ec7c097d65796056b306')

build() {
    cd "$srcdir/jdeb-$pkgname-52bac50"
    qmake PREFIX=$pkgdir/usr
    make
}

package() {
    cd "$srcdir/jdeb-$pkgname-52bac50"
    make install
}
