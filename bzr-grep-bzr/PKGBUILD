# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=bzr-grep-bzr
pkgver=147
pkgrel=1
pkgdesc="Bazaar plugin to grep files"
arch=('any')
url="https://launchpad.net/bzr-grep/"
license=('GPL')
depends=("python2" "bzr")
makedepends=("bzr")
source=()
md5sums=()
conflicts=('bzr-grep')
provides=('bzr-grep')
_bzrbranch="lp:bzr-grep"
_bzrname="bzr-grep"

build() {
	cd "${srcdir}"
	msg "Connecting to BZR server..."

	if [ -d "${srcdir}/${_bzrname}" ] ; then
		cd "${_bzrname}" && bzr pull "${_bzrbranch}"
		msg "Local repository updated."
	else
		bzr co "${_bzrbranch}"
		msg "BZR checkout done or server timeout"
	fi
}

package() {
	cd "${srcdir}/${_bzrname}"
	python2 ./setup.py install --prefix=/usr --root "${pkgdir}"
}

