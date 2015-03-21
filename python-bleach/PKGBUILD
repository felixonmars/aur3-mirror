# Submitter: fsckd <fsckdaemon@gmail.com>
# Maintainer: Kniyl <mathias.ettinger@gmail.com>
# Contributor: numeral <numerical@gmail.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=python-bleach
pkgver=1.4.1
pkgrel=1
pkgdesc="An easy whitelist-based HTML-sanitizing tool"
arch=('any')
license=('Apache')
url="http://pypi.python.org/pypi/bleach"
depends=('python' 'python-html5lib' 'python-six')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/b/bleach/bleach-${pkgver}.tar.gz")
sha256sums=('152af29d4580b112fc52966864492791c951e6382b56070e95e128c6b614833b')

build() {
  cd "${srcdir}/bleach-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/bleach-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
