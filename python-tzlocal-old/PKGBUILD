# Maintainer: Kniyl <mathias dot ettinger at gmail dot com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Patrick Burroughs <celticmadman at gmail dot com>

pkgname=python-tzlocal-old
_pkgname=tzlocal
pkgver=1.0
pkgrel=2
pkgdesc="tzinfo object for the local timezone. Older version packaged as a python-mezzanine dependency."
arch=('any')
url='https://github.com/regebro/tzlocal'
license=('custom')
depends=('python-pytz')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/${_pkgname}/${_pkgname}-$pkgver.zip")
md5sums=('cbda142be04e0292ba48a896cea8a15a')
sha256sums=('1b99ba94696c1943bff263b66f78bee86b14d3f8f01f1d117cf5df6a879ae914')
conflicts=('python-tzlocal')
provides=('python-tzlocal')

build() {
    cd "${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir"
    #install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
