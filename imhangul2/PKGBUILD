# Editor: zinc <aeiou256_at_naver_dot_com>

pkgname=imhangul2
pkgver=2.1.1
pkgrel=1
pkgdesc="Hangul input module for GTK+ 2. This supports Korean Hangul input with several types of keyboards widely used in Korea."
arch=(i686 x86_64)
url="http://code.google.com/p/imhangul/"
license=('LGPL')
depends=('gtk2' 'libhangul>=0.0.12')
source=(http://imhangul.googlecode.com/files/imhangul-2.1.1.tar.bz2)
sha1sums=('ea9b9505db22293cee08be6189cbc53282d8d7eb')

build() {
  cd ${startdir}/src/imhangul-${pkgver}
  ./configure -prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
