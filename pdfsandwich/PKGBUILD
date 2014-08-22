# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Max Roder <maxroder@web.de>

pkgname=pdfsandwich
pkgver=0.1.3
pkgrel=1
pkgdesc="Wrapper for cuneiform OCR and hocr2pdf to generate pdf files with the recognized text put behind the image (sandwich pdfs)."
url="http://sourceforge.net/projects/pdfsandwich/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('tesseract' 'exactimage' 'imagemagick' 'ghostscript' 'unpaper')
makedepends=('ocaml')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('560391afb2ad753c8453540f8a5e6ebdfbe5258b1b982931bc7993d91d26705ed3be590f3261ce0277de133acc14e1d20caaf69d2607b45db7fcafe4c253a4f1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
