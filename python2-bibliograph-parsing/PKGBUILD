# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-bibliograph-parsing
pkgver=1.0.1
pkgrel=1
pkgdesc="Parsers for bibliograph packages (bibtex)"
arch=('any')
url="http://pypi.python.org/pypi/bibliograph.parsing/"
license=('ZPL2.1')
depends=('python2' 'python2-zope-interface' 'python2-bibliograph-core' 'python2-zope-component' 'python2-zope-schema')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/b/bibliograph.parsing/bibliograph.parsing-${pkgver}.tar.gz)
md5sums=("bf291d4c00da0fd9532b9d7627fda577")

build() {
  cd "$srcdir/bibliograph.parsing-$pkgver"
  chmod +r bibliograph.parsing.egg-info/*
  python2 setup.py build
  python2 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
