# Maintainer: Army <uli armbruster who uses the google mail service>

pkgname=bluckywm-git
pkgver=20110828
pkgrel=1
pkgdesc="a very minimal and lightweight dynamic tiling window manager using xcb"
arch=('i686' 'x86_64')
url="https://github.com/moetunes/Be_Lucky_Window_Manager"
license=(GPL3)
depends=('xcb-util')
makedepends=('git')

_gitroot="https://github.com/moetunes/Be_Lucky_Window_Manager.git"
_gitname="bluckywm"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi
	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "${srcdir}/${_gitname}-build"
	cp -a "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"
	
	if test -e $startdir/config.h
	then
		msg "use custom config.h"
		cp ${startdir}/config.h .
	else
		msg "use default config.h"
		cp config.def.h config.h
	fi

	make
}

package() {
	cd "${srcdir}/${_gitname}-build"
	make PREFIX="${pkgdir}/usr" install
}
