# Maintainer: Eric Waller <ewwaller@gmail.com>
pkgname=hp48cc
pkgver=1.3
pkgrel=1
pkgdesc="hp48cc is a C-like compiler that translates input code into the HP48 RPN language. The language recognized by the compiler is only a small subset of the C language with some non-standard extensions. However, this language is powerful enough be used to to write complex programs simply."
arch=('i686' 'x86_64')
url="http://www.sigala.it/sandro/"
license=('GPL')
groups=(users)
depends=()
makedepends=()
source=(http://www.sigala.it/sandro/files/${pkgname}-${pkgver}.tar.gz)
options=('!strip')
install=

build() {
  cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
	cd src
	mkdir -p $pkgdir/usr/bin/
	install hp48cc $pkgdir/usr/bin
}

md5sums=('23f41a6168d3c17ea50537fe6ec2124a')
