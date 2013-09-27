# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=taggrepper
pkgver=0.05
pkgrel=1
pkgdesc='A small tool written to“grep” tags of media files'
arch=('i686' 'x86_64')
url="http://gitorious.org/taggrepper/"
license=('BSD')
depends=('libid3tag' 'pcre')
optdepends=('flac: FLAC files support'
'libvorbis: Vorbis files support')
source=("http://alioth.debian.org/~akumar/taggrepper-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/taggrepper-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/taggrepper-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('b94e1f8b800ae0762370f10ffd3280e9')