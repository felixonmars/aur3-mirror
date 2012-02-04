# Contributor: Ermanno <erm67@yahoo.it>
pkgname=gnuchess-book
pkgver=1.02
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Openings book for gnuchess"
url="http://www.gnu.org/software/chess"
license="GPL"
depends=('gnuchess' )
makedepends=('expect' )
install=(gnuchess-book.install)
source=("http://ftp.gnu.org/pub/gnu/chess/book_$pkgver.pgn.gz" \
        expect.sh)
md5sums=('e382f5774f050efc79a08baa083eba79'
         '42788ffda5a5f114525ac4a2328bf732')

build() {
	cd $srcdir
	expect -f expect.sh|| die 1
        mkdir -p $pkgdir/usr/share/gnuchess/
        install -m644 $srcdir/book.bin $pkgdir/usr/share/gnuchess/book-big.bin
} 
