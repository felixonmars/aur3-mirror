#Packager: Peter Johansson <johpet-9@student.ltu.se>
#Contributor: Igor "FeR" Scabini <furester@gmail.com>

pkgname=libpypac-devel
pkgver=0.7.42
pkgrel=1
arch=('i686' 'x86_64')
license=(GPL)
pkgdesc="Framework that aims on being 100% compatible with Pacman, written in Python."
url="http://home.gna.org/libpypac/"
depends=('python')
source=(http://download.gna.org/libpypac/libpypac-devel/$pkgname-$pkgver.tar.gz)
md5sums=('22f8765ba713cdc6edb7d5300135e75a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root=$startdir/pkg/
}
