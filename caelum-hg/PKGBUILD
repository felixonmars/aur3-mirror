# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=caelum-hg
pkgver=11
pkgrel=1
pkgdesc="Library for Ogre targeted to help creating photorealistic atmospheric effects"
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/tikiwiki/Caelum"
depends=('ogre' 'cegui' 'doxygen' 'boost')
makedepends=('mercurial' 'cmake')
conflicts=('caelum')
provides=('caelum')
license=('LGPL')

_hgroot="https://caelum.googlecode.com/hg"
_hgrepo="caelum"

build() {
	cd "$srcdir/$_hgrepo"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$_hgrepo"
	make DESTDIR="$pkgdir" install
	rm -r "$pkgdir/usr/doc"
}
