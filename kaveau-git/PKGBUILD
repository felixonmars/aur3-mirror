# Maintainer: Jeffery MacEachern <j.maceachern@gmail.com>

pkgname=kaveau-git
pkgver=20091224
pkgrel=1
pkgdesc="Easy to use and fully integrated backup solution for KDE"
arch=('i686' 'x86_64')
url='https://github.com/flavio/kaveau'
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'git' 'automoc4')
source=()
md5sums=()
conflicts=('kaveau')
provides=('kaveau')

_gitroot="git://github.com/flavio/kaveau.git"
_gitname="kaveau"

build() {
	cd ${srcdir}
	msg "Connecting to github.com GIT server...."

	if [ -d ${srcdir}/$_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
	else
	git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	git clone $_gitname $_gitname-build
	cd ${srcdir}/$_gitname-build
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
	make || return 1
}

package() {
	cd ${srcdir}/$_gitname-build
	make DESTDIR=${pkgdir} install || return 1
}
