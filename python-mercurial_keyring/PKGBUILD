# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Morten Nagel <hasenblut@gmail.com>
# Contributor: Sebastien Binet <binet@farnsworth>

pkgname=python-mercurial_keyring
pkgver=0.6.2
pkgrel=1
pkgdesc="Mercurial Keyring Extension"
arch=('any')
url="http://pypi.python.org/pypi/mercurial_keyring"
license=('BSD')
depends=('python-keyring')
makedepends=('python-setuptools')
install=python-mercurial_keyring.install
source=(http://pypi.python.org/packages/source/m/mercurial_keyring/mercurial_keyring-$pkgver.tar.gz python3.compat.patch)
md5sums=('6df175e7b3fbfa4423c5e13cc2f1515d'
         'e4e1a87431aaf37c75f6a09a0ed46af8')


prepare() {
  cd $srcdir/mercurial_keyring-$pkgver
  patch -p0 < $startdir/src/python3.compat.patch
}

package() {
  cd $srcdir/mercurial_keyring-$pkgver
  python setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}
