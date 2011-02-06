# Contributor: Kesara Nanayakkara Rathnayake <kesara@bcs.org>

pkgname=scim-sayura
pkgver=0.3.3
pkgrel=1
pkgdesc="Sayura is a quasi-transliteration scheme for Sinhala script."
arch=('i686')
url="http://www.sayura.net/im/"
license=('GPL')
depends=('scim')
source=(http://www.sayura.net/im/$pkgname-$pkgver.tar.gz)
md5sums=('d239f30aa0b702ba7c098a266c357dcf');

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
