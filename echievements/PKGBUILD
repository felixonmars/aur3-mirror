#Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=echievements
pkgver=3
pkgrel=2
pkgdesc="Enlightenment module: Earn achievements for using Enlightenment"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('MIT')
depends=('enlightenment17' 'etrophy' 'e_dbus')
options=('!libtool')
source=("http://download.enlightenment.org/releases/$pkgname-$pkgver.tar.bz2")
md5sums=('401aceb812611440de4374e133c8f9be')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --disable-static

  make
}

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
