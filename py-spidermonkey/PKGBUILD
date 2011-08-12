# Contributor: Andrei Antoukh - niwi@niwi.be - http://www.niwi.be

pkgname=py-spidermonkey
pkgver=0.0.10
pkgrel=1
pkgdesc="Python/JavaScript bridge module, making use of Mozilla's spidermonkey JavaScript implementation."
arch=('i686' 'x86_64')
url="http://github.com/davisp/python-spidermonkey"
license=('MIT')
depends=('xulrunner' 'python2')

source=(http://pypi.python.org/packages/source/p/python-spidermonkey/python-spidermonkey-$pkgver.tar.gz)
md5sums=('baf9d5fcd30c80829e9e65071a8238d1')

build() {
  cd "$srcdir/python-spidermonkey-$pkgver"
  python2 setup.py install --root=$startdir/pkg || return 1
}

# vim:set ts=2 sw=2 et:
