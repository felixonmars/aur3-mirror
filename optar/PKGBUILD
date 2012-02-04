# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=optar
pkgver=1
pkgrel=4
pkgdesc="OPTical ARchiver - Codec for encoding data on paper or free software 2D barcode in other words. Optar fits 200kB on an A4 page, then you print it with a laser printer. PaperBack alternative for Linux."
url="http://ronja.twibright.com/optar/"
license="GPL"
arch=('i686' 'x86_64')
depends=('imagemagick' 'libpng')
source=(
	"http://ronja.twibright.com/optar.tgz"
	"optar.300dpi.h" #low res patch for better readability
)
md5sums=('65df0e157acd16dd2383378944cb09d0'
         '0423fdc1db348e6e3a9107add799086f')

build() {
	#Make
	cd ${srcdir}/${pkgname}_dist/ || return 1
	cp -f optar.h optar.600dpi.h #backup
	mv -f ${srcdir}/optar.300dpi.h optar.h #comment this line for full resolution
	make clean || return 1
	make || return 1

	#Install
	mkdir -p ${pkgdir}/usr/bin/
	cp -f optar   ${pkgdir}/usr/bin/
	cp -f unoptar ${pkgdir}/usr/bin/
	cp -f pgm2ps  ${pkgdir}/usr/bin/

	mkdir -p ${pkgdir}/usr/share/doc/optar/
	cp -f README  ${pkgdir}/usr/share/doc/optar/
	cp -f COPYING ${pkgdir}/usr/share/doc/optar/

	#Rights
	chmod -R 755 ${pkgdir}/usr/bin
}
