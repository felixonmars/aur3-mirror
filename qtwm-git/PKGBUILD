# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>

_gitroot="git://github.com/gld1982ltd/qtwm.git"
_gitbranch=master
_gitname=qtwm

_prefix="/usr"

pkgname="$_gitname-git"
pkgver=6350.6
pkgrel=1
pkgdesc="A qt window manager"
arch=(i686 x86_64)
url="https://github.com/gld1982ltd/qtwm"
license=('LGPL')
depends=('qt5-x11extras')
optdepends=('solid' 'alsa')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
    printf "%s.%s" "$(git describe --abbrev=1 --always | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	qmake CONFIG+=release
	make
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR=${pkgdir} install
}
