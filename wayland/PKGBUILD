# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=wayland
pkgver=1.0.4
pkgrel=1
pkgdesc="A modern display server."
arch=(i686 x86_64)
url="http://wayland.freedesktop.org"
license=('MIT')
depends=('libffi')
makedepends=('expat')
options=(!libtool)
conflicts=('wayland-git')
source=(http://wayland.freedesktop.org/releases/${pkgname}-${pkgver}.tar.xz)
sha1sums=(2f65654a54366cacd39a69bc5a41fea21b357e34)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --disable-documentation
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}

