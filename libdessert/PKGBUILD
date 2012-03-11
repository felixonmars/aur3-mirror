# Maintainer: Michael Frey <mail@mfrey.net>
pkgname=libdessert
pkgver=1.07
pkgrel=1
pkgdesc="libdessert provides a simple and extensible routing-framework for testbeds "
depends=(
  'libcli'
  'uthash'
)
arch=('i686' 'x86_64')
url="http://www.des-testbed.net/DES-SERT"
license=('GPL')
source=(http://www.des-testbed.net/system/files/des-sert/$pkgname-$pkgver.tar.gz)
sha512sums=('bd4912226603a41d1d5a0922e6b48f92c365a754a30bdee7abed6376ee42e22d4af047cdfe5c36c05f0aab30689d4acbe0c5188f1e42cc64cc70924b7fa99db5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure
  make || return 1
  make DESTDIR="$pkgdir/" PREFIX='/usr' install
}

