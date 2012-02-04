# Maintainer: lilydjwg <lilydjwg@gmail.com>

# python-dateutil is conflicted/replaced/provided by python2-dateutil
pkgname=python3-dateutil
pkgver=2.0
pkgrel=2
pkgdesc="Provides powerful extensions to the standard datetime module"
arch=('any')
license=('custom:PYTHON')
url="http://labix.org/python-dateutil"
depends=('python')
makedepends=('python-distribute')
source=(http://labix.org/download/python-dateutil/python-dateutil-$pkgver.tar.gz)
md5sums=('22297f7e891bcd79a80d9446d8b20542')

package() {
  cd "${srcdir}"/python-dateutil-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE \
    "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
