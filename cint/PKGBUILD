# Contributor: dkremer <david.kremer.dk@gmail.com>

pkgname=cint
pkgver=5.18.00
pkgrel=4
pkgdesc="CINT : a C++ interpreter"

arch=('i686' 'x86_64')

url="http://root.cern.ch/drupal/content/cint"
license=('MIT')
source=("http://root.cern.ch/drupal/sites/default/files/cint-$pkgver.tgz")

md5sums=('13448895609fc924bd345e1e16f98dd2')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make|| return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
