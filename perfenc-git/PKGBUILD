# Maintainer: nobody <nobody@noplace.net>

_pkgname=perfenc
pkgname=$_pkgname-git
pkgver=2.537ad4f
pkgrel=1
pkgdesc="Perfenc is a encryption program that can encrypt/decrypt files or the standard input with one-time pads for Linux and other UNIX-like operating systems. (git version)"
arch=('armv7h' 'i686' 'x86_64')
url="http://${_pkgname}.sourceforge.net"
license=('GPL3')
depends=()
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}=0.6_beta1")
git clone git://git.code.sf.net/p/perfenc/code perfenc-code
source=("${_pkgname}::git+git://perfenc.git.sourceforge.net/gitroot/${_pkgname}/${_pkgname}")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	echo "${_pkgname}=$(git describe --tags | sed 's|-|_|g')"
}

pkgver() {
	cd "${_pkgname}"
	#echo $(git log -n 1 --date=short | sed -nr 's|^Date:\s+([0-9]{4})-([0-9]{2})-([0-9]{2})$|\1\2\3|p').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${_pkgname}"
	mkdir build && cd build && cmake ../
}

package() {
	cd "${_pkgname}/build/"
	make install PREFIX="/usr" DESTDIR="$pkgdir"
}
