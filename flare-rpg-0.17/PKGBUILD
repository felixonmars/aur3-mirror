# Contributor: Justin Jacobs <jajdorkster@gmail.com>

pkgname=flare-rpg-0.17
pkgver=20121001
pkgrel=1
pkgdesc="open source action roleplaying game"
url="http://flarerpg.org/"
license=('GPL3' 'CC-BY-SA-3.0')
arch=('i686' 'x86_64')
makedepends=('git>=1.7.10-1' 'cmake')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'hicolor-icon-theme' 'python')
install=flare-rpg-0.17.install
source=('flare-rpg-0.17.install')
sha1sums=('f1399479b57f5948fb07b188c7599c1f04d2989b')

_gitroot="git://github.com/clintbellanger/flare-game.git"
_gitname="v0.17"

build() {
	cd $srcdir
	msg "Connecting to the GIT server..."

	if [[ -d $srcdir/$_gitname ]] ; then
		cd $_gitname
		msg "Removing build files..."
		git clean -dfx
		msg "Updating..."
		git pull
		msg "The local files are updated."
	else
		msg "Cloning..."
		git clone $_gitroot $_gitname --depth 1
		msg "Clone done."
	fi

	cd $srcdir/$_gitname
	msg "Starting compile..."
	msg "Creating and moving to build directory..."
	mkdir build
	cd build
	msg "Running cmake..."
	cmake ..
	msg "Compiling..."
	make
}

package() {
	cd $srcdir/$_gitname
	msg "Compiling and installing to pkgdir this time..."
	cd build
	msg "Running cmake..."
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare-rpg
	msg "Compiling..."
	make install DESTDIR=$pkgdir
	msg "Compiling done."
}
