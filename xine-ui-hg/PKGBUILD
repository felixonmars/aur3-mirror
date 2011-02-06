# Contributor: twa022 <twa022 at gmail dot com>

pkgname=xine-ui-hg
pkgver=3073
pkgrel=1
pkgdesc="A free video player for Unix"
url="http://xine-project.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('xine-lib' 'curl' 'libxtst' 'libxinerama' 'libxv' 'libpng' 'libxft'
	'libxxf86vm' 'readline' 'xdg-utils' 'shared-mime-info' 'hicolor-icon-theme'
	'lirc-utils')
makedepends=('libxt')
options=('!emptydirs' '!strip')
provides=('xine-ui')
conflicts=('xine-ui')
replaces=('xine-ui-cvs')
source=()
md5sums=()

_hgroot=http://hg.debian.org/hg/xine-lib
_hgrepo=xine-ui

build() {
	cd ${srcdir}

	if [ -d ${_hgrepo} ]; then
		cd ${startdir}/src/${_hgrepo}
		hg pull -u
	else
		hg clone ${_hgroot}${_hgrepo} || return 1
		cd ${startdir}/src/${_hgrepo}
	fi

	msg "Mercurial checkout done or server timeout"
	msg "Starting make..."

  cp -R ${startdir}/src/${_hgrepo} ${startdir}/src/${_hgrepo}-build
  cd ${startdir}/src/${_hgrepo}-build
  ./autogen.sh

  ./configure --prefix=/usr --mandir=/usr/share/man \
    --with-x --enable-lirc --without-aalib --enable-debug || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
