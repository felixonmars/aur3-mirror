# Maintainer: kozec <kozec at kozec dot com>

pkgname=mai-at3plus-decoder
pkgver=0.1.2
pkgrel=1
pkgdesc="Mai's Atrac3+ decoder"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/maiat3plusdec/"
license=('LGPL2')
depends=()
makedepends=("dos2unix")
source=("http://garr.dl.sourceforge.net/project/maiat3plusdec/MaiAT3PlusDecoder/MaiAT3PlusDecoder_0.1.2.zip"
		patch.patch
		mai-at3.pc)

build() {
	cd "$srcdir/MaiAT3PlusDecoder"
	dos2unix src/Makefile
	[ -e src/cframedecoder.cpp ] && rm src/cframedecoder.cpp	# Patch will create this file
	patch -Np0 -i ../patch.patch
	rm -R output
	mkdir output
	cd src
	make
}

package() {
	cd "$pkgdir"
	mkdir -p usr/lib
	mkdir -p usr/include/MaiAT3PlusDecoder
	mkdir -p usr/lib/pkgconfig
	install -m755 "$srcdir/MaiAT3PlusDecoder/output/libat3plusdecoder.so" usr/lib
	install -m644 "$srcdir/mai-at3.pc" usr/lib/pkgconfig
	cp -R "$srcdir"/MaiAT3PlusDecoder/include/* usr/include/MaiAT3PlusDecoder
}

md5sums=('546bd18612638c4345aa6c0b9515ebf1'
         '8cd0b6a4df5f8c1d921dd24742484554'
         'ea75640540a9358c24a4b89349de4b34')
