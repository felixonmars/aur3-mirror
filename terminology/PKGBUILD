# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Paul Ezvan <paul@ezvan.fr>

pkgname=terminology
pkgver=0.4.0
pkgrel=1
pkgdesc="EFL based terminal emulator"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org/p.php?p=about/terminology"
license=('BSD')
depends=('elementary')
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('1e833a74f1311be2d80b2334d210d2c0099a521e61703c49f4f6a95c13cd1c6d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./configure \
    --prefix=/usr

  make
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#
#  make -k check
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
