# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python2-blinker
pkgver=1.3
pkgrel=1
pkgdesc="Fast, simple object-to-object and broadcast signaling for Python"
arch=('any')
license=('MIT')
url="http://discorporate.us/projects/Blinker/"
depends=('python2')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/b/blinker/blinker-$pkgver.tar.gz)
md5sums=('66e9688f2d287593a0e698cd8a5fbc57')

build() {
  cd "$srcdir/blinker-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1 || return 1
}
