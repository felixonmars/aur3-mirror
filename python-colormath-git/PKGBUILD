# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=python-colormath
pkgname=${_pkgname}-git
pkgver=94
pkgrel=1
pkgdesc='A Python module that abstracts common color math operations'
arch=('any')
url="http://code.google.com/p/${_pkgname}"
license=('custom:BSD')
depends=('python' 'python-numpy')
makedepends=('git' 'python-distribute')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/gtaylor/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
