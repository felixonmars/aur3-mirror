# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=whaw
pkgver=0.2
pkgrel=1
pkgdesc="window manager independent window layout tool"
arch=('i686' 'x86_64')
url="http://repetae.net/computer/whaw/"
license=('BSD3')
depends=('libxdmcp' 'libsm' 'libx11')
source=(http://repetae.net/computer/whaw/drop/$pkgname-$pkgver.tar.gz)
md5sums=('2f98d7db65390ffa74cee8e9ef3c3646')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
