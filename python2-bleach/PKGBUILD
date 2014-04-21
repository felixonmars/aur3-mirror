# Submitter: fsckd <fsckdaemon@gmail.com>
# Maintainer: numeral <numerical@gmail.com>

pkgname=python2-bleach
pkgver=1.4
pkgrel=1
pkgdesc="An easy whitelist-based HTML-sanitizing tool"
arch=('any')
license=('BSD')
url="http://pypi.python.org/pypi/bleach"
depends=('python2' 'python2-nose' 'python2-html5lib')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/b/bleach/bleach-${pkgver}.tar.gz")
md5sums=('724c24f0ae54ecb73928812a8de6cb3a')
sha256sums=('ab6947515ac2cc2fb894e718cbab1beeb342843fd816d4c2a277599ddbefba7b')

build() {
  cd "${srcdir}/bleach-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/bleach-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
