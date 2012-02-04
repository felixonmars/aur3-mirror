# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Previous Contributor: Sebastian Sareyko <public@nooms.de>
pkgname=gopdit
pkgver=0.2.9
pkgrel=1
pkgdesc="A simple program to cut and merge MPEG2-PS files at GOP boundaries without reencoding"
url="http://gopdit.ath.cx/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmpeg2' 'qt3')
source=(http://gopdit.ath.cx/$pkgname-$pkgver.tar.gz includes.patch)
md5sums=('79cc81028ea346c5572c246258ef980a'
         '6b5b6e78db89a30dda90981b85c3a98d')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../includes.patch
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR="$pkgdir" install
}
