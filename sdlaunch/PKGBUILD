# Maintainer: LEW21 <lew21@xtreeme.org>

pkgname=sdlaunch
pkgver=20120926
pkgrel=1
pkgdesc="Tool for launching daemons"
arch=(i686 x86_64)
url="https://github.com/LEW21/sdlaunch"
license=('GPL3')
depends=('boost-libs')
makedepends=('boost')

_gitroot="git://github.com/LEW21/sdlaunch.git"
_gitname="sdlaunch"

build() {
	msg "Connecting to the GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname
		git pull origin master
		cd ..
	else
		git clone $_gitroot --depth=1
	fi

	msg "Creating build directory..."
	rm -rf $_gitname-build
	cp -rH $_gitname $_gitname-build

	msg "Starting build..."
	cd $_gitname-build

	make
}

package() {
	cd ${srcdir}/$_gitname-build

	make DESTDIR="${pkgdir}/usr" install
}
