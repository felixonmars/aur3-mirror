# Maintainer: delta48 <dark.magician.48[at]gmail[dot]com> 

pkgname=renamex
_pkgname=rename
pkgver=1.99.2
pkgrel=2
pkgdesc="is a tool to rename files. It can change, lowercase and uppercase
a batch of files, or modify their ownership. It's a small and quick tool 
written in C"
arch=('i686' 'x86_64')
depends=(glibc)
url="http://rename.sourceforge.net/index.html"
license=('GPL3')
md5sums=('7467981b46f7a1626fe518c418cc93a5')
source=("http://rename.sourceforge.net/$_pkgname-$pkgver.tar.gz")

build() {
	cd "$_pkgname-$pkgver"
	sed -e 's/\/local//' -e 33,36d -e 22d -i Makefile
	make
}
package() {
	cd "$_pkgname-$pkgver"
	install -Dm 755 renamex "$pkgdir/usr/bin/renamex"
	install -Dm 644 renamex.1 "$pkgdir/usr/share/man/man1/renamex.1"
}
