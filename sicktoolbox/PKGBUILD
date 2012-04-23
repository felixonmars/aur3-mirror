# Maintainer: Mitchell Johnson <mjjohnso@mtu.edu>
pkgname=sicktoolbox
pkgver=1.0.1
pkgrel=1
pkgdesc="Provides stable and easy-to-use C++ drivers for Sick LMS 2xx and Sick LD laser range finders."
arch=('i686' 'x86_64')
url="http://sicktoolbox.sourceforge.net"
license=('BSD')
depends=('gcc-libs')
install=
source=("http://downloads.sourceforge.net/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz"
'500kbaud.patch')
noextract=()
sha256sums=('1773adc238d780d29527d8146fbc139e993138e2c69abcadfa089467c2995fe2'
            'bf1abd7a7f246bd60508d6c9cc92cf7297153b86dfd608be83e34ba3620dfa8d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../500kbaud.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
