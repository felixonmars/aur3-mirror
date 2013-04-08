# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=fwtool-git
_gitname=fwtool
pkgver=20110102
pkgrel=1
pkgdesc="PS3 Firmware PKG tool"
arch=('i686' 'x86_64')
url="http://www.teknoconsolas.es/index.php?q=blogs/waninkoko"
license=('GPLv3')
makedepends=('git')
optdepends=('geohot-ps3publictools-git' 'gpup' 'ps3-sfo-editor' 'fail0verflow-git')
source=('git://github.com/evilsperm/fwtool.git')
sha1sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
	cd "${_gitname}"
	make
}

package() {
	cd "${_gitname}"

	for src in `ls`; do
	case `file -b --mime-type "${src}"` in
		"application/x-executable")
		install -Dm755 "${src}" "${pkgdir}/usr/bin/${src}";;
	esac
	done
}