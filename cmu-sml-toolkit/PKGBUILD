# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=CMU-Cam_Toolkit_v2
pkgname=cmu-sml-toolkit
pkgver=2.05
pkgrel=2
pkgdesc="The CMU-Cambridge Statistical Language Modeling toolkit"
arch=(i686 x86_64)
url="http://www.speech.cs.cmu.edu/SLM/toolkit.html"
license=('GPL')
source=("http://www.speech.cs.cmu.edu/SLM/$_name.tar.gz")
md5sums=('ef64b894c252774fdd2e86261008198f')

build() {
  cd "$srcdir/$_name/src"

  # enable little endian build
  sed -i "/^#BYTESWAP_FLAG/s/#//" Makefile

  make
}

package() {
  cd "$srcdir/$_name/src"

  # bin
  install -d "$pkgdir/usr/bin"
  find . -perm 755 -type f -name "*[^sh]" -exec \
    install -Dm755 {} "$pkgdir/usr/bin" \;

  # header
  install -Dm644 ../include/SLM2.h \
    "$pkgdir/usr/include/SLM2.h"

  # static lib
  install -Dm644 SLM2.a \
    "$pkgdir/usr/lib/SLM2.a"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 ../doc/* \
    "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
