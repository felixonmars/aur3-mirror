# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=python-pyfm
pkgver=0.2.3
pkgrel=1
pkgdesc="A Tiny and Smart Terminal Player of douban.fm."
url="https://github.com/skyline75489/pyfm"
depends=('python-requests' 'python-urwid' 'mpg123')
optdepends=('libnotify: for system notification')
makedepends=('python-setuptools')
provides=('pyfm')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/p/pyfm/pyfm-${pkgver}.tar.gz")
sha512sums=('b3eada7a8424568ab2d7f0459fc506c1863e07b048b370b5b5d52783e049d8ee72720964bab8ab241bc39ad4b66b1da0abfb007439090c35d0d07b45ef485c93')

package() {
    cd "pyfm-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
