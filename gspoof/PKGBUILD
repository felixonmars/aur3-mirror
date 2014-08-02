# Maintainer: Florian Pritz <bluewind@xinu.at>
pkgname=gspoof
pkgver=3.2
pkgrel=2
pkgdesc="IP package generator"
arch=('i686' 'x86_64')
url="http://gspoof.sourceforge.net/"
license=('GPL')
depends=('libnet>=1.1.1' 'gtk2')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('7a1d124a1d0bed87e19b239d559ba880')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m755 "$pkgname" "$pkgdir/usr/sbin/$pkgname"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r pixmap "$pkgdir/usr/share/$pkgname/pixmap/"
}
