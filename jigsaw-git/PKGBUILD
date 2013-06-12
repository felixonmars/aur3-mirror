# Maintainer: Ryon Sherman <ryon.sherman@gmail.com>

_gitname="pentestgeek"
_pkgname="jigsaw"

pkgname="${_pkgname}-git"
pkgver=9046daa
pkgrel=2
pkgdesc="A simple ruby script for enumerating information about a company's employees. It is useful for Social Engineering or Email Phishing."

provides=(${_pkgname})

arch=('any')
license=('unknown')
url="https://github.com/${_gitname}/${_pkgname}"

depends=('ruby')
makedepends=('git')

source=("git+https://github.com/${_gitname}/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
    cd ${srcdir}/${_pkgname}
    git describe --always | sed 's|-|.|g'
}

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm0755 ${srcdir}/${_pkgname}/${_pkgname}.rb ${pkgdir}/usr/bin/${_pkgname}
}
