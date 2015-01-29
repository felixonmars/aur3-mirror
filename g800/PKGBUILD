# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=g800
pkgver=0.10.12.1
pkgrel=1
pkgdesc="SHARP PC-G850/G815/E200 Emulator"
arch=('i686' 'x86_64')
url="http://ver0.sakura.ne.jp/pc/"
license=('BSD')
depends=('sdl2')
source=("http://ver0.sakura.ne.jp/pc/g800src.${pkgver}.tgz")

build() {
	cd "${srcdir}/g800"
	make
}

package() {
	cd "${srcdir}/g800"
	install -Dm755 g800 "${pkgdir}/usr/bin/${pkgname}"
	
	cd "${srcdir}/g800/doc"
	sed -n '/Copyright (c)/,/す。/p' manual.txt > LICENSE
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 manual.txt "${pkgdir}/usr/share/doc/${pkgname}/manual.txt"
}

md5sums=('ea61ef113fa21af25dd98ca7ab877c67')
