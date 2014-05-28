# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname='python2-webob'
pkgver='1.4'
pkgrel='1'
pkgdesc="WebOb provides objects for HTTP requests and responses."
arch=('any')
url="http://webob.org/"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python-webob-docs: documentation')
changelog='Changelog'
source=("http://pypi.python.org/packages/source/W/WebOb/WebOb-${pkgver}.tar.gz")
md5sums=('8437607c0cc00c35f658f972516ffb55')

build() {
  cd "$srcdir/WebOb-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/WebOb-${pkgver}"
  python2 setup.py install "--root=$pkgdir" --optimize=1
  install -D -m644 "docs/license.txt" \
                   "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

check() {
  cd "$srcdir/WebOb-${pkgver}"
  python2 setup.py test
}
 
