# Contributor: Chad Catlett <dwi@spinjax.com>
pkgname=python-autumn
pkgver=0.5.1
pkgrel=1
pkgdesc="A lightweight ORM for Python"
depends=('python')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/a/autumn/autumn-$pkgver.tar.gz)
url="http://autumn-orm.org/"
license=('MIT')
arch=('i686' 'x86_64')
md5sums=('65aeaa009ebd295619d6afa6907413e2')

build() {
  cd "$srcdir"/autumn-$pkgver
  python setup.py install --root=$pkgdir || return 1
}

