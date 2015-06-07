# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=populate
pkgver=0.1
pkgrel=1
pkgdesc="A simple game, written in vala"
arch=('any')
url="http://archlinux.org.ru/forum/topic/14880/"
license=('GPL3')
depends=('libgee' 'gtk3')
makedepends=('vala')
source=('ai.vala' 'hexagon.vala' 'main.vala' 'Makefile' 'temp.vala')
md5sums=('061dd2a42a0dbcce77ba721f4c2b4790'
         '30acf18188056ffd044ea3c644467cf8'
         'aed4cc460367cb89d2d624b25e07cb59'
         '9ea181f66450c736a3406bc3cf36e602'
         '1aec5f0067134ac175a81c5a782964fb')

build() {
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp ${pkgname} ${pkgdir}/usr/bin/
}
