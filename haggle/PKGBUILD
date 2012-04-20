# Maintainer: Christopher T. Cannon <christophertcannon@gmail.com>
pkgname=haggle
pkgver=0.4
pkgrel=1
pkgdesc="A content-centric network architecture for opportunistic communication."
arch=('i686' 'x86_64')
url="http://code.google.com/p/haggle/"
license=('Apache')
depends=('libsqlite3pp' 'libxml2' 'openssl' 'bluez')
source=("http://haggle.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        'scope.patch')
md5sums=('36360862dcd88d5f533fea90544d55c7'
         '98c0affe0dd8a8ba8e5173e3e147c399')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    patch -p1 < ../scope.patch

    ./configure
    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make prefix="$pkgdir"/usr install
}
