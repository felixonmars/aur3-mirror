#Maintained by stlarch <stlarchie@gmail.com>
pkgname=dminiwm-git
pkgver=20120816
pkgrel=1
pkgdesc="Minimal, lightweight, dynamic tiling window manager."
url="https://github.com/moetunes/dminiwm"
license=('MIT')
depends=('libx11')
makedepends=('gcc' 'make' 'git')
arch=('i686' 'x86_64')
source=()
md5sums=()
options=(!libtool)
install="${pkgname}.install"

_gitroot="git://github.com/moetunes/dminiwm.git"
_gitname="dminiwm"

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
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

