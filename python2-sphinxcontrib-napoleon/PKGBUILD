# Maintainer: Jacques de Laval <chucky@wrutschkow.org>

pkgname=python2-sphinxcontrib-napoleon
_pkgname=sphinxcontrib-napoleon
pkgver=0.2.1
pkgrel=1
pkgdesc="Sphinx "napoleon" extension."
arch=('any')
url="https://pypi.python.org/pypi/sphinxcontrib-napoleon"
license=('BSD')
depends=('python2' 'python2-sphinx')
source=("http://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('0a77f0051d4a3f1a0d5e69aade6b4749')

package() {
    cd ${srcdir}/$_pkgname-$pkgver
    python2 setup.py install --root ${pkgdir} --optimize=1
}