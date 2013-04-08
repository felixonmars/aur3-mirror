# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=fail0verflow-ps3tools-git
_gitname=ps3tools
pkgver=20110202
pkgrel=1
pkgdesc="fail0verflow PS3 Tools"
arch=('i686' 'x86_64')
url="http://www.fail0verflow.com/"
license=('GPLv2')
makedepends=('git')
optdepends=('ps3-sfo-editor' 'fwtool-git')
source=('git://repo.or.cz/ps3tools.git')
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
		install -Dm755 "${src}" "${pkgdir}/usr/bin/f0f-${src}";;
	esac
	done
}