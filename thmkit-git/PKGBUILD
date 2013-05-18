# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=thmkit
pkgname=${_pkgname}-git
pkgver=72
pkgrel=1
pkgdesc='Utilities aimed at producing homogeneous color themes'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:Unlicense')
depends=('python-yaml' 'python-jinja' 'python-colormath-git')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/baskerville/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir/$_pkgname"
    install -D -m755 trtpl "${pkgdir}/usr/bin/trtpl"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
