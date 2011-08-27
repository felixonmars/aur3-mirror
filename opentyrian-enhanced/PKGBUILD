# Contributer Daniel J Griffiths <ghost1227@archlinux.us>

pkgname="opentyrian-enhanced"
pkgver=118
pkgrel=1
pkgdesc="C++ and feature added version of OpenTyrian"
license=('GPL')
url="http://bitbucket.org/yuriks/opentyrian-enhanced/wiki/Home"
arch=('i686' 'x86_64')
depends=('sdl_net' 'boost')
makedepends=('mercurial')
source=('http://camanis.net/tyrian/tyrian21.zip'
	'opentyrian-enhanced.desktop'
	'opentyrian-enhanced.png')
md5sums=('2a3b206a6de25ed4b771af073f8ca904'
	 '52a1eda24edb6a6fa45c94584d80ecb8'
	 '31493a38a151e4b6884e93b20a6d3e67')

_hgroot="http://bitbucket.org/yuriks"
_hgrepo="opentyrian-enhanced"

build() {
	cd ${srcdir}

	# Update the repo, else clone a new one
	if [ -d ${_hgrepo} ]; then
		cd ${_hgrepo}
		make clean
		hg pull -u
	else
		hg clone ${_hgroot}/${_hgrepo}
	fi

	cd ${srcdir}/${pkgname}

	# Fix GCC compatibility issue
	sed -i 's|DEBUG := 1|DEBUG := 0|' Makefile

	make clean release || return 1

	# Set opentyrian to save config data to $HOME
	sed -i 's|cfg_use_home false|cfg_use_home true|' autorun/00paths.con

	# Copy over original tyrian freeware files
	install -d ${pkgdir}/usr/share/opentyrian-enhanced/data
	find ${srcdir}/tyrian21/ '(' '!' -name '*.exe' ')' -exec install \
		-m644 '{}' ${pkgdir}/usr/share/opentyrian-enhanced/data/ ';'

	cp -R opentyr-data autorun ${pkgdir}/usr/share/opentyrian-enhanced/
	install -m755 opentyrian-enhanced \
		 ${pkgdir}/usr/share/opentyrian-enhanced/
	install -Dm755 launch-tyrian.sh \
		 ${pkgdir}/usr/bin/opentyrian-enhanced
	install -Dm644 ${srcdir}/opentyrian-enhanced.desktop \
		${pkgdir}/usr/share/applications/opentyrian-enhanced.desktop
	install -Dm644 ${srcdir}/opentyrian-enhanced.png \
		${pkgdir}/usr/share/pixmaps/opentyrian-enhanced.png
}
	
