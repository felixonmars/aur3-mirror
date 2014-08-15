# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname=evtest
pkgver=1.32
pkgrel=1
pkgdesc="Input device event monitor and query tool"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/evtest/"
license=('GPL')
depends=(libxml2)
makedepends=(xmlto asciidoc)
optdepends=('libxslt: to parse output from evtest-capture')
source=("http://cgit.freedesktop.org/$pkgname/snapshot/$pkgname-$pkgver.tar.bz2")
md5sums=('0c0b5439b924a7131feab9bbfea78919')
sha1sums=('5ec495e5396a61df5314322ec2fa72e44c9c2e2a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
