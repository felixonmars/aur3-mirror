# Maintainer: Nathan Ringo <tikiking1@gmail.com>

pkgname=libsbp-git
pkgver=20150415
pkgrel=1
pkgdesc="Swift Binary Protocol client libraries"
arch=('i686' 'x86_64')
url="http://swiftnav.com/"
license=('LGPL')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('libsbp')
conflicts=('libsbp')
source=('git+https://github.com/swift-nav/libsbp.git')
md5sums=('SKIP')

build() {
	mkdir "${srcdir}/libsbp/build";
	cd "${srcdir}/libsbp/build";
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../c;
	make;
};

package() {
	cd "${srcdir}/libsbp/build";
	make DESTDIR="${pkgdir}" install
};
