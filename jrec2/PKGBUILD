# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=jrec2
pkgver=0.0.1
pkgrel=1
pkgdesc="Simple patch to the jack_capture example client, that implements silence detection and splitting of output files."
arch=(i686 x86_64)
url="http://rg42.org/oss/jrec/jrec2"
license=('GPL')
depends=('jack')
source=("http://rg42.org/_media/oss/jrec/jrec-v2.c")
md5sums=('57746fff94b05dd091efb347b6b5baa8')

build() {
  cd "$srcdir/"

   gcc -l jack -lsndfile  jrec-v2.c -o jrec2
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
