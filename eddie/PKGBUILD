pkgname=eddie
pkgver=0.0.52
pkgrel=3
pkgdesc="Text editor with features to facilitate work on HTML"
arch=('x86_64')
url="http://eddietor.sourceforge.net/"
license=('GPL')
depends=( 'gambas2-runtime' 'gambas2-gb-qt' 'gambas2-gb-form' 'gambas2-gb-form-dialog' 'gambas2-gb-image' 'gambas2-gb-qt-ext')
source=(http://sourceforge.net/projects/eddietor/files/autotools/$pkgname-$pkgver.tar.gz)
md5sums=('b7acc74b54ec38edf7049ec75f55274d')
build() {
cd $srcdir/$pkgname-$pkgver

./configure
make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

