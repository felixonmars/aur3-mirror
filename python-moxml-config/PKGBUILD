# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=python-moxml-config
pkgver=0.9
pkgrel=3
pkgdesc="Python2 XML Based Configuration Management"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/python-moxml-config/"
license=('GPL3')
depends=('python2')
source=(http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b9371c3ced0b861d95926fd5bb4b85b4')


package() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py install --prefix=/usr --root=$pkgdir
}
