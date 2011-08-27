# Contributor: Alexander Tsamutali <astsmtl@yandex.ru>

pkgname=gsh
pkgver=0.3
pkgrel=1
pkgdesc="A tool to aggregate several remote shells into one."
arch=('i686' 'x86_64')
url="http://guichaz.free.fr/gsh/"
license=('GPL')
depends=('python')
source=("http://guichaz.free.fr/gsh/files/$pkgname-$pkgver.tar.bz2")
md5sums=('e15fbc254f9e8bcb4eb44071d846de98')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir"
}
