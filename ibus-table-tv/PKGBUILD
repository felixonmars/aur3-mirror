# Contributor: Smith Dhumbumroong <zodmaner@gmail.com>

pkgname=ibus-table-tv
pkgver=1.2.0.20100305
pkgrel=2
pkgdesc="Thai and Viqr (Vietnamese) tables for IBus-Table."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ibus/"
license=('GPL2')
depends=('ibus-table')
source=(http://ibus.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('765de0ac9819ea0906b9d5e28c9db5d8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
