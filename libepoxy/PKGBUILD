# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=libepoxy
pkgver=1.2
pkgrel=3
pkgdesc='a library for handling OpenGL function pointer management for you'
url="https://github.com/anholt/libepoxy"
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('xorg-util-macros' 'libx11' 'python' 'mesa')
options=('!libtool')
source=("https://github.com/anholt/libepoxy/archive/v${pkgver}.tar.gz")
sha1sums=('e700520711b9e4fa07c286aa36e431d8ad4133f5')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

