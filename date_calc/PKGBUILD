# Maintainer: gobeav3rs297 <vincent.t.cao@gmail.com>

pkgname=date_calc
pkgver=0.99
pkgrel=1
pkgdesc="A relatively simple date calculator"
arch=('i686' 'x86_64')
url="http://everydaylht.com/my-app/date-calculator"
license=('GPL')
depends=('pyqt' 'python-dateutil')
source=(http://everydaylht.com/applications/date_calculator/$pkgname.$pkgver.tar.bz2)
md5sums=('b2e1a68ea2912da0c099a3768e620a24')

build() {
  mkdir -p $pkgdir/usr/bin/date_calculator
  cd $srcdir/date_calculator
  cp * $pkgdir/usr/bin/date_calculator
  ln -s /usr/bin/date_calculator/date_calc_4.py $pkgdir/usr/bin/date_calc
}
