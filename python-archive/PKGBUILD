# Maintainer: Paul Colomiets <pc@gafol.net>
pkgname=python-archive
pkgver=0.1.1
pkgrel=1
pkgdesc="Python wrapper for libarchive"
arch=('x86_64' 'i686')
url="http://github.com/tailhook/pyarchive"
license=('MIT')
depends=('libarchive' 'python>=3.2')
makedepends=('git')
source=("http://pypi.python.org/packages/source/p/pyarchive/pyarchive-$pkgver.tar.gz")
md5sums=("6cd1b274d69aea8886fb10e19b44d234")

build() {
  cd "$srcdir/pyarchive-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
