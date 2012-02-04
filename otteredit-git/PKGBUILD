# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=otteredit-git
pkgver=20090917
pkgrel=1
pkgdesc="Source code editor with simple project management"
url="https://sourceforge.net/projects/otteredit/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('wxgtk')
makedepends=('git' 'cmake')
conflicts=()
replaces=()
backup=()
source=()
md5sums=()

_gitroot="git://otteredit.git.sourceforge.net/gitroot/otteredit/otteredit"
_gitname="otteredit"

build() {
	cd ${srcdir}
	msg "Connecting to SourceForge.net GIT server...."

	if [ -d ${srcdir}/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout."
	
	
	msg "Starting make..."
	git clone $_gitname $_gitname-build
	cd ${srcdir}/$_gitname-build
	
	mkdir build
	cd build
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr/ .. || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}

