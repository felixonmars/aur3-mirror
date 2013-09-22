# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgname=nosexunit
_pkgname=NoseXUnit
pkgver=0.3.3
pkgrel=5
pkgdesc="Provide a convenient way to produce JUnit like XML reports with PyUnit."
arch=('any')
url="http://nosexunit.sourceforge.net/"
license=('LGPL')
depends=('python2-nose' 'pylint' 'python2-coverage' 'kid' 'python2-pygments' 'python-logilab-common' 'python-logilab-astng')

source=(http://downloads.sourceforge.net/nosexunit/${_pkgname}-${pkgver}.zip)
md5sums=('ed317e8f8e1cf5facae07d3d26d58c05')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

