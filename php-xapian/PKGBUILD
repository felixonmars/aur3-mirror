# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>

pkgname=php-xapian
pkgver=1.2.20
pkgrel=1
pkgdesc="PHP bindings for Xapian"
arch=('i686' 'x86_64')
url="http://xapian.org/docs/bindings/php/"
license=('GPL')
depends=('php' 'xapian-core' 'util-linux')
backup=('etc/php/conf.d/xapian.ini')
source=(http://oligarchy.co.uk/xapian/$pkgver/xapian-bindings-$pkgver.tar.xz)
sha1sums=('8460c0f56edf06091026076219caf114bf05f327')

build() {
  cd "$srcdir/xapian-bindings-$pkgver"

  ./configure --prefix=/usr --with-php
  make
}

check() {
  cd "$srcdir/xapian-bindings-$pkgver"

  make -k check
}

package() {
  cd "$srcdir/xapian-bindings-$pkgver"

  make DESTDIR="$pkgdir" install

  # Move xapian.php into /usr/share/pear
  mv "$pkgdir/usr/share/"{php5,pear}

  echo ';extension=xapian.so' >xapian.ini
  install -Dm644 xapian.ini "$pkgdir/etc/php/conf.d/xapian.ini"
}

# vim:set ts=2 sw=2 et:
