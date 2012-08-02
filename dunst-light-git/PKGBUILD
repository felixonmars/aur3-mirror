_pkgname=dunst
pkgname=${_pkgname}-light-git
pkgver=20120802
pkgrel=1
pkgdesc="dmenu-ish notification system, the light version"
arch=(i686 x86_64)
url="http://knopwob.github.com/dunst"
license=(BSD)
depends=(dbus-core libxinerama libxdg-basedir)
makedepends=('git' 'perl')
optdepends=('libnotify: dunst is able to listen to notifications from libnotify')
provides=(${_pkgname} notification-daemon)
conflicts=(${_pkgname} ${_pkgname}-git ${_pkgname}-xft-git)

_gitroot="https://github.com/knopwob/dunst.git"
_gitname="${_pkgname}-light"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	
	if [ -d ${_gitname} ] ; then
		cd ${_gitname}
		git pull
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi
	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "${srcdir}/${_gitname}-build"
	cp -a "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"
	
    if test -e ${startdir}/config.h
    then
        msg "use custom config.h"
        cp ${startdir}/config.h .
    else
        msg "use default config.h"
    fi

	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${srcdir}/${_gitname}-build"
	make DESTDIR=${pkgdir} PREFIX=/usr install
#	install -Dm644 "${srcdir}/dunst-build/LICENSE.dmenu" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
