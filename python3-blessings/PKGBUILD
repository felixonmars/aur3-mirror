# Maintainer: Kevin Thomas <hamgom95 at gmail dot com>
pkgname=python3-blessings
pkgver=1.5
pkgrel=1
pkgdesc="A thin, practical wrapper around terminal coloring, styling, and positioning"
arch=(any)
url="https://github.com/erikrose/blessings"
license=('MIT')
depends=('python>=3.2')
makedepends=('python-setuptools')
provides=('python-blessings')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/b/blessings/blessings-${pkgver}.tar.gz)
md5sums=('368094303d698512f86e1aab8dde3b9e')

build() {
   cd "${srcdir}/blessings-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
