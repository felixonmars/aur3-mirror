# Maintainer: Iwan Gabovitch <qubodup@gmail.com>

pkgname=fbg2
pkgver=0.4
pkgrel=1
pkgdesc="Falling Block Game. Block stacking game. Tetris Clone."
arch=(i686 x86_64)
url="http://fbg.sourceforge.net/"
license=("GPL" "CCP:cc-by-sa-3.0")
depends=('lua' 'sdl' 'radius-engine')
conflicts=()
source=(http://sourceforge.net/projects/fbg/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('119fe15939882fee97195aea2bc2ccba')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr --sysconfdir=/etc 
	make || return 1
	make DESTDIR=${startdir}/pkg install

}

