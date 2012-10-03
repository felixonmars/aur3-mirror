# Maintainer: Mizuchi <ytj000@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgname=python2-graph
pkgver=1.8.2
pkgrel=2
pkgdesc="A library for working with graphs in Python"
arch=('any')
url="http://code.google.com/p/python-graph/"
license=('MIT')
depends=('python2' 'pydot')
makedepends=('python2-distribute')
source=(
    "http://python-graph.googlecode.com/files/python-graph-core-$pkgver.tar.gz"
    "http://python-graph.googlecode.com/files/python-graph-dot-$pkgver.tar.gz")
sha1sums=(
    "e06d87edaa9d73a1c4fc9c0a9b593fac9123e241"
    "855abaf43611de7382b7a2d28fb0863860946593")

build() {
  cd "$srcdir/python-graph-core-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  cd "$srcdir/python-graph-dot-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
