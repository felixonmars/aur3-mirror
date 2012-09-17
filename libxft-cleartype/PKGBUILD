# Maintainer: Ben Reedy <thebenj88 *AT* gmail *DOT* com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: freedom
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libxft-cleartype
pkgver=2.3.1
pkgrel=1
pkgdesc="FreeType-based font drawing library for X with ClearType patch"
arch=('i686' 'x86_64')
url=('http://xorg.freedesktop.org/')
license=('GPL')
depends=('fontconfig' 'libxrender')
conflicts=('libxft')
provides=("libxft=$pkgver")
makedepends=('pkgconfig')
options=('!libtool')
source=(http://xorg.freedesktop.org/releases/individual/lib/libXft-${pkgver}.tar.bz2)
sha1sums=('c7ec1361e3d4f095910f8c58988ab42e32f314d9')

build() {
	cd "${srcdir}/libXft-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc --disable-static
	make
	make DESTDIR="${pkgdir}" install
	install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}"
}
