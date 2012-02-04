# Contributor: Viliam Pucik < viliam dot pucik at gmail dot com >
pkgname=randtype
pkgver=1.13
pkgrel=1
pkgdesc="Randtype reads either standard input or text files and displays the output, character-by-character or line-by-line, at random intervals"
arch=('i686' 'x86_64')
url="http://bjk.sourceforge.net/randtype/"
license="GPL"
depends=('zlib')
makedepends=('gcc' 'make')
source=(http://sourceforge.net/projects/bjk/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz/download)
md5sums=('56ebbfbe399b2050954c0b0c6dd93652')

build() {
	cd $srcdir/
	tar xf download
	cd $pkgname-$pkgver

	make || return 1
	mkdir -p $pkgdir/usr/share/man/man1
	mkdir -p $pkgdir/usr/bin

	install -p -m 0644 $pkgname.1.gz $pkgdir/usr/share/man/man1
	install -ps -m 0755 $pkgname $pkgdir/usr/bin
}
