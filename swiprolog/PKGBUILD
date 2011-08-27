# Maintainer: Jozef Kolek <jkolek@gmail.com>
pkgname=swiprolog
pkgver=5.10.1
pkgrel=1
epoch=
pkgdesc="A prolog interpreter"
arch=('i686' 'x86_64')
url="http://www.swi-prolog.org/"
license=('SWIPL' 'LGPL' 'GPL')
groups=()
depends=('gmp' 'readline')
makedepends=('gcc' 'make' 'autoconf')
checkdepends=()
optdepends=('unixodbc: database access support'
			'openssl: ssl support'
			'zlib: compressed streams support'
			'openjdk6: java interface support'
			'libxt: gui support'
			'libxft: unicode font support for xpce')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('519e1515574fd861864770553382674e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr/local
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

