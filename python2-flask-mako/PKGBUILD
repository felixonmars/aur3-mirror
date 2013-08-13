# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=python2-flask-mako
pkgver=0.2
pkgrel=1
epoch=1
pkgdesc="Provides Mako support in Flask"
arch=('any')
url="https://pypi.python.org/pypi/Flask-Mako"
license=() # None specified
depends=('python2-flask' 'python2-mako')
source=(https://pypi.python.org/packages/source/F/Flask-Mako/Flask-Mako-$pkgver.tar.gz)
sha256sums=('9749f87cee02bc53015b22adac448907f197487b2f16046627760f4e96d06949')

build() {
  cd "$srcdir/Flask-Mako-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/Flask-Mako-$pkgver"
  python2 setup.py install --root="$pkgdir" --prefix=/usr
}

# vim:set ts=2 sw=2 et:
