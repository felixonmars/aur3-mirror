# Maintainer: Brad Conte <brad AT bradconte.com>

pkgname=ntl
pkgver=6.2.1
pkgrel=1
#epoch=
pkgdesc="A Library for doing Number Theory"
arch=('i686' 'x86_64')
url="http://www.shoup.net/ntl/"
license=('GPL')
groups=()
depends=('gf2x' 'gmp')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!libtool')
#install=
#changelog=
source=("http://www.shoup.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
noextract=()
sha512sums=('2a06be4d58c86cf2bf043f58a181efb1181aff72f2628df1e5a6d12314ce094c77f55d498659531bca632819c4028bc452a061cbbd9b13626e4622d78d2eee5d')

#prepare() {
#}

build() {
	cd "$srcdir/$pkgname-$pkgver/src"
	./configure DEF_PREFIX=/usr SHARED=on NTL_GF2X_LIB=on NTL_GMP_LIP=on || return 1
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/src"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver/src"
	make PREFIX="$pkgdir/usr" install
}

