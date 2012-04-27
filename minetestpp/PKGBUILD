pkgname=minetestpp
pkgver=20120409
pkgrel=1
pkgdesc="An Infiniminer/Minecraft inspired minetest fork with more features than minetest."
arch=('i686' 'x86_64')
url="http://minetestpp.tk/"
license=('GPL')
makedepends=('git' 'cmake' 'irrlicht' 'mesa' 'libjpeg' 'bzip2' 'libpng' 'zlib')
depends=('libjpeg' 'bzip2' 'sqlite3' 'libgl' 'libxxf86vm' 'openal')
conflicts=('minetest' 'minetest-hg' 'minetest-git')

_srcroot="https://github.com/jordan4ibanez/minetest.git"
_srcname="minetest"

build() {
	cd "$srcdir"

	msg "Pulling sources..."

	if [ -d $_srcname ] ; then
		cd $_srcname && git pull origin
		msg "The local files are updated."
	else
		git clone $_srcroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd "$srcdir/$_srcname"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make DESTDIR=${pkgdir} install
}
