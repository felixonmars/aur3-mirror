# Maintainer: Lucas8 <luc.linux@mailoo.org>
# Contributor: Lucas8 <luc.linux@mailoo.org>

pkgname=scrlock-git
pkgver=0.2
pkgrel=1
pkgdesc="Improved slock."
arch=('i686' 'x86_64')
url=https://github.com/lucas8/scrlock
license=('MIT')
groups=
provides=('scrlock')
depends=('libxext')
optdepends=('fswebcam: needed by spy mode')
makedepends=('git' 'make')
conflicts=()
replaces=()
backup=()

install=

_gitroot='git://github.com/lucas8/scrlock.git'
_gitname='scrlock'
build() {
	msg "Getting sources from github."
	if [[ -d $_gitname ]] ; then
		msg "Updating local sources."
		cd $_gitname
		git pull origin || return 1 
	else
		git clone $_gitroot || return 1
		msg "Sources downloaded."
		cd $_gitname
	fi

	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 || return 1
}

package() {
	cd $_gitname
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -m644 -D LICENSE "$pkgdir/usr/share/licences/scrlock/LICENCE"
}

