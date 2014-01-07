# $Id$
# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=python-pycountry
_pkgname=pycountry
pkgver=1.3
pkgrel=1
pkgdesc="ISO country, subdivision, language, currency and script definitions and their translations"
arch=('any')
url="http://pypi.python.org/pypi/pycountry"
license=('LGPL')
depends=('python-lxml' 'python-distribute')
source=("http://pypi.python.org/packages/source/p/pycountry/pycountry-$pkgver.zip")
sha512sums=('6dfdcc5b2436e9a28ae6f1622afa6900f5d4a63a6791cef404a0be1f365b5c43771a31271caeda61d02a6ce3f4ed656f0cd3984254a32b7810c5c556b66d200f')

package() {
    cd "${srcdir}/pycountry-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
