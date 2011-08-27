pkgname='dwm-par'
pkgver=1513
pkgrel=2
pkgdesc="dwm with a dark blue theme"
url="http://dwm.suckless.org"
license='MIT'
arch=('i686' 'x86_64')
depends=('libx11' 'acpi')
makedepends=('mercurial' 'sed')
conflicts=('dwm')
provides=('dwm')
source=()
md5sums=()

_hgroot='http://hg.suckless.org/'
_hgrepo='dwm'

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

	# patch
	wget http://www.sfu.ca/~paa4/code/dwm-par.patch.tar.gz
	tar xvfz dwm-par.patch.tar.gz
	patch config.def.h config.def.h.patch

	make || return 1
	make PREFIX=$startdir/pkg/usr install

	mkdir -p $startdir/pkg/usr/share/licenses/dwm
	cp LICENSE $startdir/pkg/usr/share/licenses/dwm
}