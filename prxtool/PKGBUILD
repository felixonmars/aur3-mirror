# Mantainer The Lemon Man <segnalazionidalweb @ gmail>
pkgname=prxtool
pkgver=20120327
pkgrel=1
pkgdesc='The ultimate tool for every PSP hacker.'
arch=('i686' 'x86_64')
license=('AFL')
depends=()
makedepends=()
url="https://github.com/pspdev/prxtool"

_gitroot="https://github.com/pspdev/prxtool.git"
_gitname="prxtool"

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi
	
	msg "GIT checkout done or server timeout"
	rm -rf "${srcdir}/${_gitname}-build"
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"

	msg "Building..."
    ./bootstrap -v || true
    ./configure --prefix="/usr"
    make
}

package() {
	cd "${srcdir}/${_gitname}-build"
    install -Dm755 prxtool ${pkgdir}/usr/bin/prxtool
}

