# Maintainer: Bar Hofesh <bar.hofesh@linux.com>

pkgname='ruby-clang'
pkgdesc='An object-oriented language for quick and easy programming, compiled using clang'
pkgver=2.2.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.ruby-lang.org/en/'
license=('BSD' 'custom')
depends=('openssl' 'libffi' 'libyaml' 'clang')
optdepends=('tk: for Ruby/TK')
makedepends=('openssl' 'tk' 'libffi' 'doxygen' 'graphviz' 'libyaml' 'clang')
provides=('rubygems' 'rake')
options=('!emptydirs' '!makeflags')
source=("http://cache.ruby-lang.org/pub/ruby/2.2/ruby-$pkgver.tar.gz")

build() {
  cd ruby-${pkgver//_/-}
  export CC="/usr/bin/clang"
  PKG_CONFIG=/usr/bin/pkg-config ./configure --enable-shared --disable-rpath
  make
}

check() {
  cd ruby-${pkgver//_/-}

  make test
}

package() {

  cd ruby-${pkgver//_/-}

  make DESTDIR="${pkgdir}" install-nodoc

  install -dm755 $pkgdir/usr/bin
  install -dm755 $pkgdir/usr/lib
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/$pkgname/BSDL"
}
sha256sums=('7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc')