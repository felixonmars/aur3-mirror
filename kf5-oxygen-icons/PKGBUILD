# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kf5-oxygen-icons
pkgver=4.12.80
pkgrel=1
pkgdesc="The Oxygen Icon Theme"
arch=('any')
url='http://www.oxygen-icons.org/'
license=('LGPL')
makedepends=('cmake' 'automoc4')
options=('!strip')
source=("http://download.kde.org/unstable/${pkgver}/src/oxygen-icons-${pkgver}.tar.xz")
sha1sums=('5158058b266e6d2489685d9d80108516dbe375fd')

build() {
	cd $srcdir
	mkdir build
	cd build
	cmake ../oxygen-icons-${pkgver} \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF \
		-DCMAKE_INSTALL_PREFIX=/opt/kf5
	make
}

package_kf5-oxygen-icons() {
	cd $srcdir/build
	make DESTDIR=$pkgdir install
	
	cd $srcdir/oxygen-icons-${pkgver}
	find scalable -type f ! -name '*.sh' -exec \
		install -D -m644 "{}" "${pkgdir}/opt/kf5/share/icons/oxygen/{}" \;
}
