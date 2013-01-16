# Contributor: matthiaskrgr <matthiaskrgr _strange_curverd_character_ freedroid D0T org>

pkgname=flare-rpg-git
pkgver=20130115
pkgrel=1
pkgdesc="open source action roleplaying game"
url="http://www.flarerpg.org/"
license=('GPL3' 'CC-BY-SA-3.0')
arch=('i686' 'x86_64')
makedepends=('git>=1.7.10-1' 'cmake')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'hicolor-icon-theme' 'python')
conflicts=('flare-rpg')
replaces=('flare-rpg')
changelog=changelog
install=flare-rpg-git.install
source=('changelog'
        'flare-rpg-git.install')
sha1sums=('61c4bf866d1683606560f656f9ba9f698cb09bb8'
          'f1399479b57f5948fb07b188c7599c1f04d2989b')

_gitroot="git://github.com/clintbellanger/"
_gitname="flare-rpg"
_repo="flare-game"

build() {
	cd $srcdir
	msg "Connecting to the GIT server..."

	if [[ -d $srcdir/$_repo ]] ; then
		msg "Updating flare-game"
		cd $_repo
		msg "Removing build files..."
		git clean -dfx
		msg "Updating..."
		git pull --no-tags
		msg "Updating flare"
	else
		msg "Cloning..."
		git clone $_gitroot$_repo --depth 1 --single-branch

		msg "Clone done."
	fi

	cd $srcdir/$_repo
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
	cd $srcdir/$_repo
	msg "Compiling and installing to pkgdir this time..."
	cd build
	msg "Running cmake..."
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare-rpg
	msg "Compiling..."
	make install DESTDIR=$pkgdir
}
