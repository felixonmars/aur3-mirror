# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname='python-webob'
pkgver=1.4
pkgrel=1
pkgdesc="WSGI request and response object"
arch=('any')
url="http://pythonpaste.org/webob/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-webob-docs: documentation')
changelog='Changelog'
source=("http://pypi.python.org/packages/source/W/WebOb/WebOb-${pkgver}.tar.gz")
md5sums=('8437607c0cc00c35f658f972516ffb55')

build() {
  cd "$srcdir/WebOb-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/WebOb-${pkgver}"
  python setup.py install --root="$pkgdir"
  install -D -m644 "docs/license.txt" \
                   "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

check() {
  cd "$srcdir/WebOb-${pkgver}"
  python setup.py test
}

