# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: blitux <blitux at gmail dot com>

pkgname=pyhumod
pkgver=0.03
pkgrel=2
pkgdesc="Using Huawei modems in Python"
arch=('any')
url="http://code.google.com/p/pyhumod/"
license=('GPL')
depends=('python2-pyserial')
source=(http://pyhumod.googlecode.com/files/pyhumod-$pkgver.tar.gz)
md5sums=('481330d25e19d751e1450f6bbfb31118')


package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr
}
