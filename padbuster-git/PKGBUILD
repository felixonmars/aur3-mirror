# Maintainer: Ryon Sherman <ryon.sherman@gmail.com>

_gitname="GDSSecurity"
_pkgname="PadBuster"

pkgname="padbuster-git"
pkgver=320a020
pkgrel=1
pkgdesc="Automated script for performing Padding Oracle attacks."

provides=(${_pkgname,,})

arch=('any')
license=('RPL1.5')
url="https://github.com/${_gitname}/${_pkgname}/"

depends=('perl-crypt-ssleay')
makedepends=('git')

source=("git+https://github.com/${_gitname}/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
    cd ${srcdir}/${_pkgname}
    git describe --always | sed 's|-|.|g'
}

package() {
    cd ${srcdir}/${_pkgname}

    install -d ${pkgdir}/usr/{bin,share/doc/${_pkgname,,}}
    install -Dm755 ${_pkgname,}.pl ${pkgdir}/usr/bin/${_pkgname,,}
    install -Dm644 README ${pkgdir}/usr/share/doc/${_pkgname,,}
}
