# Maintainer: Phil Schaf <flying-sheep@web.de>
_pypiname=Distutils2-py3
pkgname=python-distutils2
pkgver=1.0a5.dev0
pkgrel=1
pkgdesc='python distribution utilities'
arch=('any')
url="http://pypi.python.org/pypi/$_pypiname"
license=('PSF')
depends=('python')
source=("http://pypi.python.org/packages/source/D/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha1sums=('9d2fbca4dc8bf94e2ffd9a528c19b5f1aca0e15c')

package() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    find "$pkgdir" -name "*.exe" -delete
}
