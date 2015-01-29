# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=bm2
pkgver=20140928
pkgrel=1
pkgdesc="HITACHI BASIC MASTER Jr. Emulator"
arch=('i686' 'x86_64')
url="http://ver0.sakura.ne.jp/pc/"
license=('BSD')
depends=('sdl2')
source=("http://ver0.sakura.ne.jp/pc/bm2src_${pkgver}.tgz")

build() {
	cd "${srcdir}/bm2"
	make
}

package() {
	cd "${srcdir}/bm2"
	install -Dm755 bm2 "${pkgdir}/usr/bin/${pkgname}"
	
	sed -n '/Copyright (c)/,/す。/p' readme.txt > LICENSE
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 readme.txt "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
}

md5sums=('d21fac90404ad8befd5a398e8b4c9c51')
