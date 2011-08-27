# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Laszlo Papp <djszapi2 at gmail.com>

pkgname=huffman
pkgver=1.1
pkgrel=1
pkgdesc="A library and a command line program for Huffman encoding and decoding"
arch=('i686' 'x86_64')
url="http://huffman.sourceforge.net/"
license=('BSD')
depends=('glibc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('419dae94887ad4dcc04d1b7c0869db87')

build() {
  cd "$srcdir"/$pkgname
  make || return 1
  install -Dm755 huffcode "$pkgdir"/usr/bin/huffcode
  install -Dm644 libhuffman.a "$pkgdir"/usr/lib/libhuffman.a
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
