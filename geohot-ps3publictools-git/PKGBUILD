# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=geohot-ps3publictools-git
_gitname=ps3publictools
pkgver=20110111
pkgrel=1
pkgdesc="geohot's public tools for the PS3"
arch=('i686' 'x86_64')
url="https://github.com/geohot/ps3publictools"
license=('GPLv3')
makedepends=('git')
optdepends=('ps3-sfo-editor' 'fwtool-git' 'fail0verflow-ps3tools-git')
source=('git://github.com/Acruber/ps3publictools.git')
sha1sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
	cd "${_gitname}"
	make linux
}

package() {
	cd "${_gitname}/build"

	for src in `ls`; do
	case `file -b --mime-type "${src}"` in
		"application/x-executable")
		install -Dm755 "${src}" "${pkgdir}/usr/bin/${src}";;
	esac
	done
}