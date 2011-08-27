# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Daniele Stanzani <d.stanzani@gmail.com>
pkgname="biew"
pkgver="610"
pkgrel=1
pkgdesc="BEYE (Binary EYE) is a free, portable, advanced file viewer with built-in editor for binary, hexadecimal and disassembler modes. It contains a highlight AVR/Java/i86-AMD64/ARM-XScale/PPC-64 and other disassembler, full preview of MZ,NE,PE,ELF and other."
arch=('i686' 'x86_64')
url="http://beye.sourceforge.net/"
license=('GPL')
depends=(slang ncurses)
source=(http://sourceforge.net/projects/beye/files/biew/6.1.0/$pkgname-$pkgver-src.tar.bz2/download)
md5sums=('1b6477defaa61b8ca0f2ae1254978e94')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
