# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname=cuevanalib
pkgver=0.6
pkgrel=1
pkgdesc="A library trying to work as cuevana.tv missing API"
arch=('any')
url="http://pypi.python.org/pypi/cuevanalib/"
license='GPL3'
depends=('python2-pyquery')
source=(http://pypi.python.org/packages/source/c/cuevanalib/cuevanalib-0.6.tar.gz)
md5sums=('1045757ee17e3028d4590c11f39839e7')

build() {
   cd $srcdir/$pkgname-$pkgver

   python2 setup.py install --root $pkgdir --optimize=1
}