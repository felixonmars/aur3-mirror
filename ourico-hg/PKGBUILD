# Contributer: v2punkt0 <v2punkt0@gmail.com>

pkgname='ourico-hg'
pkgver=26
pkgrel=1
pkgdesc="The latest hg pull of ourico"
url="http://www.rootshell.be/~polachok/code/"
license='MIT'
arch=('i686' 'x86_64')
depends=('libx11' 'libxft' 'pkgconfig')
makedepends=('mercurial' 'sed')
conflicts=('ourico')
provides=('ourico')
source=()
md5sums=()

_hgroot='http://freehg.org/u/polachok'
_hgrepo='ourico'

build() {
	cd $startdir/src

	# update the repo, else clone a new one
	if [ -d $_hgrepo ]; then
		cd $_hgrepo
		make clean
		hg pull -u
	else
		hg clone ${_hgroot}/${_hgrepo}
		cd $_hgrepo
	fi

	# add correct settings to config.mk
	sed -i "s|^PREFIX =.*|PREFIX = /usr|" config.mk
	sed -i "s|^X11INC =.*|X11INC = /usr/include/X11|" config.mk
	sed -i "s|^X11LIB =.*|X11LIB = /usr/lib/X11|" config.mk

	msg "Starting build process."
	make || return 1
	make PREFIX=$startdir/pkg/usr install

	mkdir -p $startdir/pkg/usr/share/licenses/ourico
	cp LICENSE $startdir/pkg/usr/share/licenses/ourico
}
