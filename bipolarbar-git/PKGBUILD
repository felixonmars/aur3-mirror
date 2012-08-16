#Maintained by stlarch <stlarchie@gmail.com>
pkgname=bipolarbar-git
pkgver=20120816
pkgrel=1
pkgdesc="Status bar for dminiwm, monsterwm, or maybe others that can show two sets of information at different timings."
url="https://github.com/moetunes/bipolarbar"
license=('GPL2')
depends=('libx11')
makedepends=('gcc' 'make' 'git')
arch=('i686' 'x86_64')
source=()
md5sums=()
options=(!libtool)
install="${pkgname}.install"

_gitroot="git://github.com/moetunes/bipolarbar.git"
_gitname="bipolarbar"

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi

	msg "GIT checkout done."
	rm -rf "${srcdir}/${_gitname}-build"
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"

	if [ -e $startdir/config.h ]
	then
		msg "Using custom config.h."
		cp ${startdir}/config.h .
	else
		msg "Using default config.h."
		cp "${srcdir}/${_gitname}-build/config.h.def" "${srcdir}/${_gitname}-build/config.h"
	fi
}

package() {
	cd "${srcdir}/${_gitname}-build"
	make PREFIX=/usr DESTDIR=${pkgdir} install
	install -Dm644 "Readme.md" "${pkgdir}/usr/share/doc/${pkgname}/Readme.md"
}

