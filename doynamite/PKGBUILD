# Maintainer: lobotomius at gmail dot com

pkgname=doynamite
pkgver=1.0
pkgrel=1
pkgdesc="c64 data compression software"
arch=('i686' 'x86_64')
url="http://csdb.dk/release/?id=118678"
license=('unknown')
source=('http://csdb.dk/getinternalfile.php/116973/doynamite%201.0.zip')
md5sums=('03742ed603b7b135b070d7f62a636795')
build() {
	cd "$srcdir/"
	gcc -o lz lz.c
	gcc -o unlzip unlzip.c
}

package() {
    cd "$srcdir/"
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 lz unlzip "$pkgdir/usr/bin"
}
