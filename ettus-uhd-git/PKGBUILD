# Maintainer: Markus Fuchs <mail att mfuchs d0tt org>
pkgname=ettus-uhd-git
pkgver=20101013
pkgrel=0
pkgdesc="The Ettus Research UHD Toolkit to communicate with USRPs"
arch=('i686' 'x86_64')
license=('GPL')
#depends=()
depends=('git' 'cmake' 'boost' 'libusb' 'python-cheetah')
optdepends=('doxygen: generate html api' 'docutils: generate html user manual')
provides=('ettus-uhd')
url="http://www.ettus.com"
source=()
md5sums=()

_target=uhd
_repo=git://ettus.sourcerepo.com/ettus/${_target}.git

build() {
	cd ${srcdir}/
	echo ${pkgsrc}
	echo ${_repo}
	git clone ${_repo}

	cd ${_target}/host
	install -d build
	cd build
	cmake  -DCMAKE_INSTALL_PREFIX=/usr ../

	make || return 1
	make test || return 1
	make DESTDIR=${pkgdir} install || return 1

	msg "Install done, make sure to run ldconfig as root"
}
