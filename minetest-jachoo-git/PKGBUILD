pkgname=minetest-jachoo-git
pkgver=20111024
pkgrel=1
pkgdesc="A minetest-fork with clan-system, git version."
arch=('i686' 'x86_64')
url="https://github.com/jachoo/"
license=('GPL')
makedepends=('git' 'cmake' 'irrlicht' 'mesa' 'libjpeg' 'bzip2' 'libpng' 'zlib')
depends=('libjpeg' 'bzip2' 'sqlite3' 'libgl' 'libxxf86vm')
conflicts=('minetest' 'minetest-hg' 'minetest-git')
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/jachoo/minetest-jachoo"
_gitname="minetest"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd "$srcdir/$_gitname"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make DESTDIR=${pkgdir} install
}
