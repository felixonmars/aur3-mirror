# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=openssn
pkgver=1.4
pkgrel=1
pkgdesc="A submarine simulator (subsim) for modern classes of submarine"
arch=('i686' 'x86_64')
url="http://openssn.sourceforge.net/"
license=('GPL')
depends=('sdl_gfx' 'sdl_image' 'sdl_mixer')
source=("http://downloads.sourceforge.net/project/openssn/openssn-${pkgver}/openssn-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/openssn"
	make
}

package() {
	cd "${srcdir}/openssn"
	make PREFIX="${pkgdir}/usr" install
}

md5sums=('0fe1f5aca75163a4196e83beb9d0cd25')
