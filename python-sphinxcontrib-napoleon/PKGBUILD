# Maintainer: Ethan Zonca <ethanzonca@ethanzonca.com>

pkgname=python-sphinxcontrib-napoleon
_pkgname=sphinxcontrib-napoleon
pkgver=0.2.8
pkgrel=1
pkgdesc="Sphinx "napoleon" extension."
arch=('any')
url="https://pypi.python.org/pypi/sphinxcontrib-napoleon"
license=('BSD')
depends=('python' 'python-sphinx')
source=("http://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('004abec2393a8743a150a9d64a85d517')

package() {
    cd ${srcdir}/$_pkgname-$pkgver
    python setup.py install --root ${pkgdir} --optimize=1
}
