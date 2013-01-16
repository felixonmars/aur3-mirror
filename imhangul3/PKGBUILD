# Editor: zinc <aeiou256_at_naver_dot_com>

pkgname=imhangul3
pkgver=3.1.1
pkgrel=1
pkgdesc="Hangul input module for GTK+ 3. This supports Korean Hangul input with several types of keyboards widely used in Korea."
arch=(i686 x86_64)
url="http://code.google.com/p/imhangul/"
license=('LGPL')
depends=('gtk3' 'libhangul>=0.0.12')
source=(http://imhangul.googlecode.com/files/imhangul-3.1.1.tar.bz2)
sha1sums=('f7dd491ef7598c1bd02f84925959c757ad69b620')

build() {
  cd ${startdir}/src/imhangul-${pkgver}
  ./configure -prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
