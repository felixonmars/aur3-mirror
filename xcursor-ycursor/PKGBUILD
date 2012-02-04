#Maintainer: karnath <karnathtorjian@gmail.com>

pkgname=xcursor-ycursor
pkgver=2
pkgrel=1
pkgdesc="xcursor theme"
arch=('any')
license=('public domain')
url="http://www.customize.org/"
source=("http://archive.customize.org/files/xcursors/ycursors2.tbz2")
md5sums=('45369bbdeb953f86c5ceb0b5ec5ce8ed')

build() {
    mkdir -p $pkgdir/usr/share/icons/ycursors/cursors
    cp -a $srcdir/ycursors/* $pkgdir/usr/share/icons/ycursors/cursors
}


