#Contributor: karnath <karnathtorjian@gmail.com>

pkgname=pushmem
pkgver=0.1
pkgrel=1
pkgdesc="Not very usefull program which tries to push as much memory pages to swap as possible"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc')
url="http://www.vanheusden.com/Linux/"
source=("http://www.vanheusden.com/Linux/pushmem-0.1.tgz")
md5sums=('7b1cc73de37211034b404b8a9fe04e5b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/bin
    make DESTDIR=$pkgdir install || return 1
}


