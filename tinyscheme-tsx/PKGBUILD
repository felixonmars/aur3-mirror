# submitter: perlawk
# Maintainer: perlawk

pkgname=tinyscheme-tsx
pkgver=1.41
pkgrel=2
pkgdesc="Tinyscheme with TSX: have extension include network, system, sqlite3, encryption."
url="https://github.com/perlawk/tinyscheme-tsx"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('sqlite3')
conflicts=("tinyscheme")

prepare() {
  cd "${srcdir}"/
  if [ ! -e $pkgname ]; then
    git clone "https://github.com/perlawk/tinyscheme-tsx.git"
  fi
}


build() {
	cd "$srcdir"/$pkgname-$pkgver
	make ts tsx
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	make install
	cp src/lib*a "$pkgdir"/usr/lib
	ls -l  "$pkgdir"/usr/lib/*
}
