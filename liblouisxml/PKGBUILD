pkgname='liblouisxml'
pkgver='2.4.0'
pkgrel='1'
pkgdesc='Library to do Braille transcription of XML documents'
license='LGPL'
url='http://code.google.com/p/liblouisxml'
source=( "https://liblouisxml.googlecode.com/files/${pkgname}-${pkgver}.tar.gz" )
sha1sums=( 'e4b23667d23cd14377588d86a85a78422382f668' )
arch=( 'i686' 'x86_64' )
depends=( 'liblouis' 'libxml2' )
makedepends=( 'help2man' )

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
