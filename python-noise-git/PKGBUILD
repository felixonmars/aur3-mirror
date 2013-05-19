# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=noise
pkgname=python-${_pkgname}-git
pkgver=35
pkgrel=1
pkgdesc='Perlin noise library for Python'
arch=('i686' 'x86_64')
url="http://code.google.com/p/${_pkgname}"
license=('custom:MIT')
depends=('python')
makedepends=('git' 'python-distribute')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/caseman/${_pkgname}.git")
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
