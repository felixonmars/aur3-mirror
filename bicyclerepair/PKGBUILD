# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=bicyclerepair
pkgver=0.9
pkgrel=2
pkgdesc="Bicycle Repair Man, a Refactoring Browser for Python"
url="http://bicyclerepair.sourceforge.net/"
arch=('i686')
license="GPL"
depends=('python')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f825f48384febefacf0717738e909321')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root=$startdir/pkg/ --prefix=/usr
}
