# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

_pkg=zope.event
pkgname=zope-event
pkgver=3.5.0
pkgrel=2
pkgdesc="Zope Event Publication"
arch=('any')
url="http://cheeseshop.python.org/pypi/zope.event/"
license=('ZPL')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/z/$_pkg/$_pkg-$pkgver-1.tar.gz")
md5sums=('5940673553add7a75ec47d3b916ba7d1')

build() {
  cd "$srcdir/$_pkg-$pkgver-1"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkg-$pkgver-1"

  python2 setup.py install --root="$pkgdir/"
}
