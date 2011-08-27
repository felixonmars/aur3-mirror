# Maintainer: Laszlo Papp < djszapi at archlinux us >

pkgname=pyunit
pkgver=1.4.1
pkgrel=1
pkgdesc="Standard unit testing framework for Python"
arch=('i686')
url="http://www.logilab.org/project/pylint"
license=('GPL')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz?use_mirror=surfnet)
md5sums=('658ff16afc469a3898260cc72bbea993')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

