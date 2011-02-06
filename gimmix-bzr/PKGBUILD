pkgname=gimmix-bzr
pkgver=469
pkgrel=1
pkgdesc="graphical MPD client written in C using GTK+2 - bzr version"
url="http://gimmix.berlios.de/"
arch=('i686' 'x86_64')
license="GPL"
depends=('libglade>=2.6.0' 'libmpd' 'taglib' 'libnxml')
makedepends=('bzr>=1.0')
conflicts=('gimmix')
provides=('gimmix')
options=('!libtool')
source=()
md5sums=()

_bzrmod=gimmix

build() {
	cd $startdir/src

	bzr branch lp:$_bzrmod

	msg "Bazaar checkout done or server timeout"
	msg "Starting make..."

	# Install
	cd $_bzrmod
	sh autogen.sh
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
}

