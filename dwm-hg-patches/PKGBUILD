# Contributer: v2punkt0 <v2punkt0@gmail.com>

pkgname='dwm-hg-patches'
pkgver=1507
pkgrel=1
pkgdesc="The latest hg pull of dwm with the "attach-aside", "useless-gap" and "transpenrency" patches"
url="http://dwm.suckless.org"
license='MIT'
arch=('i686' 'x86_64')
depends=('libx11' 'xcompmgr')
makedepends=('mercurial' 'sed')
conflicts=('dwm')
provides=('dwm')
source=(
	dwm-hg-patches.install
	http://0mark.unserver.de/dwm-sprinkles/export/31/trunk/patches/dwm-transparency.diff
	http://dwm.suckless.org/patches/dwm-attachaside-5.7.2.diff
	http://dwm.suckless.org/patches/dwm-uselessgap-5.8.diff		
)

install=('dwm-hg-patches.install')


_hgroot='http://code.suckless.org/hg'
_hgrepo='dwm'

build() {
        cd $startdir/src

	# update the repo, else clone a new one
	if [ -d $_hgrepo ]; then
		rm -rf $_hgrepo
                hg clone ${_hgroot}/${_hgrepo}
                cd $_hgrepo
	else
		hg clone ${_hgroot}/${_hgrepo}
		cd $_hgrepo
	fi

        cd $startdir/src/dwm

        patch -Np1 -i ../dwm-attachaside-5.7.2.diff || return 1
        patch -Np1 -i ../dwm-uselessgap-5.8.diff || return 1
        patch -Np1 -i ../dwm-transparency.diff || return 1

        cd $startdir/src/dwm

	# add correct settings to config.mk
	sed -i "s|^PREFIX =.*|PREFIX = /usr|" config.mk
	sed -i "s|^X11INC =.*|X11INC = /usr/include/X11|" config.mk
	sed -i "s|^X11LIB =.*|X11LIB = /usr/lib/X11|" config.mk

	cp ../../config.h ./

	msg "Starting build process."
	make || return 1
	make PREFIX=$startdir/pkg/usr install

	mkdir -p $startdir/pkg/usr/share/licenses/dwm
	cp LICENSE $startdir/pkg/usr/share/licenses/dwm
	
	msg " ATTENTION edit config.h from the source dir of this AUR package manually if you want to recompile with your customizations."
}


md5sums=('2bf54c1b9b6e9adc133180a9b1b19344'
         '650cb426e4bf9117aab8f4bd3613b5e8'
         'a92ee04c33b1082da61b55d3617249eb'
         '47a467e2ae6b5ed2b58e1bf7cb7c966a')
