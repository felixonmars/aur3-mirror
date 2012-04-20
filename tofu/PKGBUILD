# Maintainer: examon <examon.mail[at]gmail[dot]com>

pkgname=tofu
pkgver=3.5
pkgrel=2
pkgdesc="A small, efficient todo list manager"
arch=('any')
url="http://requiescant.tuxfamily.org/tofu/"
license=('MIT')
depends=('perl>=5.8.8')
source=(http://requiescant.tuxfamily.org/files/$pkgname-$pkgver.tar.gz)
md5sums=('a09d9b2d9527d5baf76d69415210b45f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --fhs --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
