# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: satanselbow <igdfpm@gmail.com>
pkgname=mkcue
pkgver=1_8.1
pkgrel=1
pkgdesc="Generates CUE sheets from an audio CD TOC (Table Of Contents). It is a perfect, and only compatible, companion for abcde to generate backups of your audio CDs using the FLAC/APE/WAV codecs utilising the single track option."
arch=('i686' 'x86_64')
url="https://diplodocus.org/dist/audio/"
license=('GPL')
depends=('gcc-libs')
makedepends=('rpmextract' 'make')
checkdepends=()
optdepends=('musicbrainz' 'abcde')
provides=(mkcue)
options=('emptydirs')
source=('http://download.opensuse.org/repositories/home:/zhonghuaren/Fedora_18/src/mkcue-1-8.1.src.rpm'
	'http://archive.ubuntu.com/ubuntu/pool/universe/m/mkcue/mkcue_1-3_i386.deb')
md5sums=('52acae9c2532922c14f37e0dbb4e957a'
         'd237737a4b33ac3ed5290bd56bbcde35')

build() {
	cd ${srcdir}
	# extract man from deb
	ar xv mkcue_1-3_i386.deb
	tar -xvzf data.tar.gz
	# extract src from rpm
	rpmextract.sh ./mkcue-1-8.1.src.rpm
	tar jxf ./mkcue-1.tar.bz2
	cd ${srcdir}/mkcue-1
	./configure --prefix=/usr --mandir=/usr/share/man/man1
	make
}


package() {
	mkdir -p ${pkgdir}/usr/share/man/man1
	cd ${srcdir}/usr/share/man/man1
	cp mkcue.1.gz ${pkgdir}/usr/share/man/man1
	cd ${srcdir}/mkcue-1
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/doc/mkcue-1
	make DESTDIR="$pkgdir" install
	cp {,AUTHORS,COPYING,README} ${pkgdir}/usr/share/doc/mkcue-1
}
