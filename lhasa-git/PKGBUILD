# Maintainer: Bastien Dejean <baskerville@lavabit.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=lhasa
pkgname=${_pkgname}-git
pkgver=366
pkgrel=1
pkgdesc='Free Software LHA implementation'
arch=('i686' 'x86_64')
url="http://fragglet.github.com/${_pkgname}"
license=('custom:ISC')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'lha')
source=("git://github.com/fragglet/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    ./autogen.sh --prefix=/usr
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
