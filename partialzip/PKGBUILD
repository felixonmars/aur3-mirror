# Maintainer: pictuga <generaleduweb at gmail dot com>

pkgname=partialzip
pkgver=20130107
pkgrel=1
pkgdesc="Using curl's partial downloading feature to retrieve selected portions of ZIP files"
arch=(i686 x86_64)
license=('LGPL')
depends=(curl)
makedepends=(cmake)
url="https://github.com/planetbeing/partial-zip"

_gitroot="git://github.com/pictuga/partial-zip.git"
_gitname="partial-zip"

build() {
	cd ${srcdir}/

	msg "Connecting to the GNOME GIT server..."
	if [[ -d ${srcdir}/${_gitname} ]] ; then
		cd ${_gitname}
		git pull origin
		msg "The local files are updated..."
	else
		git clone ${_gitroot} ${gitname}
	fi

	msg "GIT checkout done."

	msg2 "Starting make for: ${pkgname}"

	if [[ -d ${srcdir}/${_gitname}-build ]]; then
		msg "Cleaning the previous build directory..."
		rm -rf ${srcdir}/${_gitname}-build
	fi

	git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

	cd ${srcdir}/${_gitname}-build
	
	msg "Starting configure..."
	
	cmake .
	make
}

package() {
	install -m755 -D "${srcdir}/${_gitname}-build/partialzip" "${pkgdir}/usr/bin/partialzip"
}
