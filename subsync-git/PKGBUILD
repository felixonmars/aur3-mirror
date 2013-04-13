pkgname=subsync-git
pkgver=20130413
pkgrel=1
pkgdesc="Simple CLI tool written in Go, that synchronizes SubRip (srt) subtitles automatically."
arch=('i686' 'x86_64')
url=https://github.com/oblique/subsync
license=(BSD)
makedepends=('go')
provides=('subsync')
conflicts=('subsync')

_gitroot="git://github.com/oblique/subsync.git"
_gitname="subsync"

build() {
	export GOPATH="${srcdir}/godir"
	mkdir -p "$GOPATH"

	cd "${srcdir}"

	if [ -d ${_gitname}-build ]; then
		rm -rf ${_gitname}-build
	fi

	if [ -d ${_gitname} ]; then
		cd ${_gitname}
		git pull --rebase
	else
		git clone ${_gitroot} ${_gitname}
	fi

	cd "${srcdir}"
	cp -r ${_gitname} ${_gitname}-build
	cd ${_gitname}-build
	make
}

package() {
	cd "${srcdir}/${_gitname}-build"
	install -D subsync "${pkgdir}/usr/bin/subsync"
}
