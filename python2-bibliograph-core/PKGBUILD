# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-bibliograph-core
pkgver=1.0.1
pkgrel=1
pkgdesc="Core definitions of bibliograph packages (bibtex)"
arch=('any')
url="http://pypi.python.org/pypi/bibliograph.core"
license=('ZPL2.1')
depends=('python2' 'python2-zope-interface')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/b/bibliograph.core/bibliograph.core-${pkgver}.tar.gz)
md5sums=("d203fc4f2e0ef9b61eaf13af38f0aad0")

build() {
  cd "$srcdir/bibliograph.core-$pkgver"
  chmod +r bibliograph.core.egg-info/*
  python2 setup.py build
  python2 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
