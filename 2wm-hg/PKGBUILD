# Maintainer: Ryan Stephenson <rycs42 gmail com>

pkgname=2wm-hg
pkgver=16
pkgrel=1
pkgdesc="Dual window manager prototype - The latest hg pull"
url="http://hg.suckless.org/2wm/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11')
makedepends=('mercurial' 'sed')
conflicts=('2wm')
provides=('2wm')

_hgroot='http://code.suckless.org/hg'
_hgrepo='2wm'

build() {
	cd $startdir/src

	# Update the repo, else clone a new one
	if [ -d $_hgrepo ]; then
		cd $_hgrepo
		make clean
		hg pull -u
	else
		hg clone ${_hgroot}/${_hgrepo}
		cd $_hgrepo
	fi

	# Add correct settings to config.mk
	sed -i "s|^PREFIX =.*|PREFIX = /usr|" config.mk
	sed -i "s|^X11INC =.*|X11INC = /usr/include/X11|" config.mk
	sed -i "s|^X11LIB =.*|X11LIB = /usr/lib/X11|" config.mk

	msg "Starting build process."
	make || return 1
	make PREFIX=$startdir/pkg/usr install

	mkdir -p $startdir/pkg/usr/share/licenses/2wm
	cp LICENSE $startdir/pkg/usr/share/licenses/2wm
}
