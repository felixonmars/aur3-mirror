# Submitter: fsckd <fsckdaemon@gmail.com>
# Maintainer: numeral <numerical@gmail.com>

pkgname=python2-bleach
pkgver=1.2.1
pkgrel=1
pkgdesc="An easy whitelist-based HTML-sanitizing tool"
arch=('any')
license=('BSD')
url="http://pypi.python.org/pypi/bleach"
depends=('python2' 'python2-nose' 'python2-html5lib')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/b/bleach/bleach-${pkgver}.tar.gz")
md5sums=('23b7500fe90ba10469df4ee148a415ee')
sha256sums=('3c2ccd0c7b13e2fdcd757198f385d64be708341b397c414f0c0538b56e6bb24c')

build() {
  cd "${srcdir}/bleach-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/bleach-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
