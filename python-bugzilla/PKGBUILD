# Maintainer: Giulio Fidente <gfidente at gmail dot com>
pkgname=python-bugzilla
pkgver=0.8.0
pkgrel=1
pkgdesc="A python module for interacting with Bugzilla over XMLRPC"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/python-bugzilla/"
license=("GPL")
depends=("python2")
source=("https://fedorahosted.org/releases/p/y/python-bugzilla/$pkgname-$pkgver.tar.gz")
sha1sums=("8bf13e568f04ec35fe767a7507080f7c0724a7b5")

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}
