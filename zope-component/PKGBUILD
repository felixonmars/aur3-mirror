# Maintainer : SpepS <dreamspepsera at yahoo dot it>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

_pkg=zope.component
pkgname=zope-component
pkgver=3.10.0
pkgrel=2
pkgdesc="Zope Component Architecture"
arch=('any')
url="http://cheeseshop.python.org/pypi/zope.component/"
license=('ZPL')
depends=('zope-interface' 'zope-event')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/z/$_pkg/$_pkg-$pkgver.tar.gz")
md5sums=('8041d92540e701943daed97329012348')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  python2 setup.py install --root="$pkgdir/"
}