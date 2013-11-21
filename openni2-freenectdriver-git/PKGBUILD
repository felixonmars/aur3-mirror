# Maintainer: Andrew DeMaria <ademaria AT mines DOT edu>
pkgname=openni2-freenectdriver-git
pkgver=20130917
pkgrel=1
pkgdesc="Comptability layer for interacting with libfreenect with openni 2 libraries"
arch=('i686' 'x86_64')
url="https://github.com/piedar/OpenNI2-FreenectDriver"
license=('APACHE')
depends=('libfreenect' 'openni2')
makedepends=('git' 'python')
provides=('openni2-freenectdriver')
conflicts=('openni2-freenectdriver')
install="openni2-freenectdriver.install"

_gitroot="https://github.com/piedar/OpenNI2-FreenectDriver.git"
_gitname=OpenNI2-FreenectDriver
_openni_drivers_dir="/usr/lib/OpenNI2/Drivers"

build() {
	msg "Preparing git repo"

	if [ ! -d "${srcdir}/${_gitname}" ]; then
		git clone ${_gitroot}
	else
		cd ${_gitname} && git pull origin
	fi

	msg "Cloned/updated git repo"

	cd ${srcdir}
	rm -rf "${_gitname}-build"
	git clone "${_gitname}" "${_gitname}-build"
	cd "${_gitname}-build"

	./waf configure build

}

package() {

	install -d ${pkgdir}/usr/lib

	cd "${srcdir}/${_gitname}-build/build"
	install "libFreenectDriver.so" ${pkgdir}/usr/lib
}

