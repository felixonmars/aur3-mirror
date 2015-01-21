#Maintainer: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
pkgname='dmplex'
pkgver=1
pkgrel=3
pkgdesc="A simple dzen multiplexer"
arch=('i386' 'i686' 'x86_64')
url="http://dzen.geekmode.org/dwiki/doku.php?id=dzen:multiplexer"
license=('MIT')
source=('https://raw.githubusercontent.com/qbbr/dzenbar/master/dmplex.c')
sha512sums=('0de00afc2335c774d5a4738ee45963bd3bf90bac5180ce126e61dc9f2a785ebc90883936b8d13d972c860fb6793240827b9b076df7915db5eb85903964396ca8')

build() {
	cd "$srcdir"
	gcc -Wall dmplex.c -o dmplex
}

package() {
	cd "$srcdir"
	install -Dm755 dmplex "$pkgdir/usr/bin/dmplex"
}
