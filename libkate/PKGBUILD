# Maintainer: N30N <archlinux@alunamation.com>
# Contributer: linkmauve <linkmauve@linkmauve.fr>
# Contributer: mokkurkalve <xenofil@gmail.com>

pkgname=libkate
pkgver=0.4.1
pkgrel=1
pkgdesc="Kate is an overlay codec, originally designed for karaoke and text, that can be multiplixed in Ogg"
url="http://${pkgname}.googlecode.com/"
license=("BSD")
arch=("i686" "x86_64")
depends=("libogg" "libpng" "python2")
makedepends=()
optdepends=("liboggz: to build example streams, or" \
	"ogg-tools: to build example streams" \
	"flex: to rebuild the parser, and" \
	"bison: to rebuild the parser" \
	"wxpython: for KateDJ")
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=("1dfdbdeb2fa5d07063cf5b8261111fca")

build() {
	cd ${pkgname}-${pkgver}

	export PYTHON="/usr/bin/python2"
	sed "1s/python$/python2/" -i tools/KateDJ/KateDJ

	./configure --prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set noet ff=unix
