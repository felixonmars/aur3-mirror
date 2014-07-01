# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=nuclear-git
pkgver=v0.1.r11.gd6891d0
pkgrel=1
pkgdesc='A Shell plugin for Weston'
arch=(i686 x86_64)
url="https://github.com/nuclide/nuclear"
license=('LGPL')
depends=('weston')
makedepends=('git' 'cmake')
options=(!libtool)
source=(git://github.com/nuclide/nuclear.git)
sha1sums=('SKIP')

pkgver() {
	cd nuclear
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd nuclear
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd nuclear
	cd build
	make DESTDIR=${pkgdir} install

}
