
# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=classic_invaders
pkgver=1.0
pkgrel=2
pkgdesc="A classic alien space shooter."
arch=('i686' 'x86_64')
url="http://www.noquarterarcade.com/"
license=(BSD)
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf')
madepends=('make' 'boost' 'gcc')
source=(http://www.noquarterarcade.com/downloads/classic-invaders-${pkgver}.tar.bz2  classic-invaders.desktop)
md5sums=('f45972a293176a0ce58177f48ca45d83'
         'e33db523dbabb36dc83f773cee6e6152')

build() {
	cd ${srcdir}/classic-invaders-${pkgver}
	./configure --prefix=/usr
	make 
}

package() {
	mkdir -p ${pkgdir}/usr/share/applications/
	cd ${srcdir}/classic-invaders-${pkgver}
	make DESTDIR=${pkgdir} install
	install -c -m 644 ${srcdir}/classic-invaders.desktop ${pkgdir}/usr/share/applications/classic-invaders.desktop
}
