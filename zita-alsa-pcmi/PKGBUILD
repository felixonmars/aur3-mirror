# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=zita-alsa-pcmi
pkgver=0.2.0
pkgrel=1
pkgdesc="The successor of clalsadrv, provides easy access to ALSA PCM devices."
arch=(i686 x86_64)
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL3')
depends=('alsa-lib')
source=("${url}downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('0ba4d59abce231056e2628d081124114')

build() {
  cd "$srcdir/$pkgname-$pkgver/libs"

  # libs
  make PREFIX=/usr

  # create lib link for building apps
  ln -s lib$pkgname.so.$pkgver lib$pkgname.so

  # apps
  cd ../apps
  CXXFLAGS+=" -I../libs" \
  LDFLAGS+=" -L../libs" \
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver/libs"

  # libs
  install -Dm755 lib$pkgname.so.$pkgver \
    "$pkgdir/usr/lib/lib$pkgname.so.$pkgver"

  # link
  ln -s lib$pkgname.so.$pkgver \
    "$pkgdir/usr/lib/lib$pkgname.so"

  # header
  install -Dm644 $pkgname.h \
    "$pkgdir/usr/include/$pkgname.h"

  # apps
  install -Dm755 ../apps/alsa_delay \
    "$pkgdir/usr/bin/alsa_delay"
  install -Dm755 ../apps/alsa_loopback \
    "$pkgdir/usr/bin/alsa_delay"
}

# vim:set ts=2 sw=2 et:
