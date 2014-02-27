# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=gw2dattools-git
pkgver=r21.7424bee
pkgrel=1
pkgdesc="Collection of tools to make building programs for the gw2 dat file easier"
arch=(i686 x86_64)
url="https://github.com/klusark/gw2DatTools"
license=('LGPL')
makedepends=('git' 'cmake')
source=(git://github.com/klusark/gw2DatTools.git)
sha1sums=('SKIP')

pkgver() {
	cd gw2DatTools
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd gw2DatTools
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd gw2DatTools
	cd build
	make DESTDIR=${pkgdir} install

}
