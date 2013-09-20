# Maintainer: Bastien Dejean <nihilhill@gmail.com>

_pkgname=deheader
pkgname=${_pkgname}-git
pkgver=121
pkgrel=2
pkgdesc='Analyzes C and C++ files to determine which header inclusions can be removed'
arch=('i686' 'x86_64')
url="http://www.catb.org/esr/${_pkgname}"
license=('custom:BSD')
depends=('python2')
makedepends=('git' 'xmlto')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://gitorious.org/${_pkgname}/${_pkgname}.git" "${_pkgname}.patch")
md5sums=('SKIP'
         '97c2750c6fb55740b0b38ece66f40d12')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

prepare() {
    cd "$srcdir/$_pkgname"
    patch -p1 -i "$srcdir/${_pkgname}.patch"
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -D -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -D -m644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
