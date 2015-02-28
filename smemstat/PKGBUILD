# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=smemstat
pkgver=0.01.11
pkgrel=1
pkgdesc="Shared memory statistics. Reports physical memory usage taking into consideration shared memory."
arch=('i686' 'x86_64')
url="http://kernel.ubuntu.com/~cking/smemstat/"
license=('GPL2')
depends=('glibc')
changelog=Changelog
source=("http://kernel.ubuntu.com/~cking/tarballs/smemstat/smemstat-${pkgver}.tar.gz")
sha256sums=('5ebfc24a75dd0328dc1939640c1dc959c5caaa81e7da0a0bf4d5eb3cc3885239')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
