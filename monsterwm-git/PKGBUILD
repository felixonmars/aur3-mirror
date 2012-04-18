#Maintained by ivoarch <ivkuzev@gmail.com> 
pkgname=monsterwm-git
pkgver=20120418
pkgrel=3
pkgdesc="Very minimal, lightweight, monsterous, tiny, dynamic tiling window manager"
url="https://github.com/c00kiemon5ter/monsterwm"
arch=('i686' 'x86_64')
license=('MIT/X')
groups=('modified')
depends=('libx11')
makedepends=('git') 
conflicts=('monsterwm-xcb') 
md5sums=('')

_gitroot="git://github.com/c00kiemon5ter/monsterwm.git"
_gitname="monsterwm"
_gitbranch="master"

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

