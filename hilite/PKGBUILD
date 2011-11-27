# Maintainer: Kevin Cox (youarefunny - ktcox@rogers.com)
pkgname=hilite
pkgver=1.5
pkgrel=1
pkgdesc="Highlight stderr"
url="https://sourceforge.net/projects/hilite/"
license=('GPL')
arch=('i686' 'x86_64')
depends=()
optdepends=()
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/hilite.c")
md5sums=('0214a3ef553cf4cf1e41f9c3bf93ca83')

build() {
	mkdir -p "$pkgdir/usr/bin/"
	gcc -O2 -o "$pkgdir/usr/bin/hilite" "$srcdir/hilite.c"
}
