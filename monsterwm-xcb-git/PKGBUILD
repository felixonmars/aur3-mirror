#Maintainer: <Army @ bbs.archlinux.org, feel free to contact me there>

pkgname=monsterwm-xcb-git
pkgver=20120125
pkgrel=1
pkgdesc="Very minimal, lightweight, monsterous, tiny, dynamic tiling window manager (xcb port)"
url="https://github.com/Cloudef/monsterwm-xcb"
arch=('i686' 'x86_64')
license=('custom:MIT/X')
depends=('xcb-util-wm' 'xcb-util-keysyms')
makedepends=('git')
conflicts=('monsterwm-git')

_gitroot="git://github.com/Cloudef/monsterwm-xcb.git"
_gitname="monsterwm"

_gitbranch="master"
# if you want to try the dualhead branch, remember to update your config.h accordingly
#_gitbranch="dualhead"

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname} -b ${_gitbranch}
	fi
	
	msg "GIT checkout done or server timeout"
	rm -rf "${srcdir}/${_gitname}-build"
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"

	if [ -e $startdir/config.h ]
	then
		msg "use custom config.h"
		cp ${startdir}/config.h .
	else
		msg "use default config.h"
	fi
}

package() {
	cd "${srcdir}/${_gitname}-build"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
