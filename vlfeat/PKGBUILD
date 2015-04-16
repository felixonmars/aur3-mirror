# Contributor: Ilya Mezhirov <mezhirov@iupr.com>

pkgname=vlfeat
pkgver=0.9.20
pkgrel=1
pkgdesc="A library of computer vision algorithms covering feature extraction, data clustering and image segmentation."
arch=('i686' 'x86_64')
url="http://www.vlfeat.org"
license=('BSD')
md5sums=('c2c03ed46e0fe0ed5c24b922dba76494')

depends=('glibc')
source=("$url/download/$pkgname-$pkgver.tar.gz")

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i 's!include make/matlab.mak!# include make/matlab.mak!g;' Makefile
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p  "$pkgdir/usr/include/vl"
    cp vl/*.h "$pkgdir/usr/include/vl"

    mkdir -p               "$pkgdir/usr/lib"
    cp bin/*/libvl.so "$pkgdir/usr/lib"

    mkdir -p           "$pkgdir/usr/bin"
    cp bin/*/mser "$pkgdir/usr/bin"
    cp bin/*/sift "$pkgdir/usr/bin"

    mkdir -p   "$pkgdir/usr/share/man"
    cp src/*.1 "$pkgdir/usr/share/man"

    mkdir -p   "$pkgdir/usr/share/licenses/vlfeat"
    cp COPYING "$pkgdir/usr/share/licenses/vlfeat"   
}
md5sums=('b6986c9d74783c8cf814f57cf7fe2a7e')
