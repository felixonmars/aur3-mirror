#Maintainer: Randy Heydon <randy.heydon at clockworklab dot net>
pkgname=python2-pylibftdi
pkgver=0.11
pkgrel=1
pkgdesc="Pythonic interface to FTDI devices using libftdi"
arch=(any)
url="http://bitbucket.org/codedstructure/pylibftdi"
license=('MIT')
depends=('python2' 'libftdi')
source=(http://pypi.python.org/packages/source/p/pylibftdi/pylibftdi-$pkgver.tar.gz)
md5sums=('eaaf46597574405d9060a0b83d7d40d8')

build() {
  cd $srcdir/pylibftdi-$pkgver
  python2 ./setup.py install --root=$pkgdir --optimize=1 || return 1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
