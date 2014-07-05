# Contributor: Leen Jewel <leenjewel@gmail.com>
# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=msgpack
pkgver=0.5.9
pkgrel=1
pkgdesc="An efficient object serialization library"
arch=('i686' 'x86_64')
url="http://msgpack.org/"
license=('Apache')
depends=('gcc-libs')
source=("https://github.com/$pkgname/$pkgname-c/releases/download/cpp-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('7645691e6966421c817a0b6f6f306112')

build()
{
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
