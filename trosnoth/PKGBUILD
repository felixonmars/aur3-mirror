# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=trosnoth
pkgver=1.6.0
pkgrel=2
pkgdesc="Free network platform game written in Python."
arch=('any')
url="http://www.trosnoth.org/"
license=('GPL2')
depends=('python2-pygame' 'twisted')
source=(http://pypi.python.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('cb845df8fc4ead72814be405017b1235')

build() {
  cd $srcdir/$pkgname-$pkgver

  python2 setup.py install --root=$pkgdir --optimize=1
}
