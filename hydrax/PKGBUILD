# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=hydrax
pkgver=0.5.4
pkgrel=1
pkgdesc="An add-on for Ogre that renders pretty water scenes"
arch=('i686' 'x86_64')
depends=('ogre' 'boost')
url="http://www.ogre3d.org/tikiwiki/Hydrax"
license=('LGPL3')
source=("https://launchpad.net/~sonsilentsea-team/+archive/sonsilentsea/+files/lib${pkgname}_$pkgver-5.tar.gz")
md5sums=('b3001c89989ce9413f7436fdf236cd3f')

build() {
	cd "$srcdir/lib$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/lib$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
