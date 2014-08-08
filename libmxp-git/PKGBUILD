# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>
_pkgname=libmxp
pkgname="$_pkgname-git"
pkgver=20121119
pkgrel=1
provides=('libmxp')
pkgdesc="MUD eXtension Protocol library."
arch=('i686' 'x86_64')
url="http://www.kmuddy.com/libmxp"
license=('LGPL')
depends=()
makedepends=('cmake')
_gitroot="git://anongit.kde.org/kmuddy"
_gitname="kmuddy"

build() {
		cd "$srcdir"
		msg "Connecting to GIT server..."
		if [ -d $_gitname ] ; then
			cd $_gitname && git pull origin
			cd ..
			msg "The local files are updated."
		else
			git clone --depth=1 $_gitroot $_gitname
		fi
		msg "GIT checkout done or server timeout"

		cd $_gitname/$_pkgname
		cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr

		make || return 1
	}
package() {
		make DESTDIR=${pkgdir} install
	  }
