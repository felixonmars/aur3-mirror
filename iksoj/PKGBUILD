
# Maintainter: Joop Kiefte <joop@kiefte.eu>
pkgname=iksoj
pkgver=0.4.2
pkgrel=1
pkgdesc="iksoj is a command to convert the Esperanto x-system to unicode"
arch=('i686' 'x86_64')
url=http://github.com/LaPingvino/iksoj/
license=('CC0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/LaPingvino/iksoj/archive/${pkgver}.tar.gz")
sha256sums=('d460cbdf5fda25da2d150d088ada2dc7e11e171d6d217292a9bec4af8d553695')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i "s@/usr/bin@${pkgdir}/usr/bin@" Makefile
	make install
}

