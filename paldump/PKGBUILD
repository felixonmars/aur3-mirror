# Contributor: Jon Kristian Nilsen <jonn3@broadpark.no>

pkgname=paldump
pkgver=0.1
pkgrel=1
pkgdesc="DVD palette extractor, shrink DVDs with subtitles."
arch=('i686' 'x86_64')
url="http://www.winki-the-ripper.de/"
license=('GPL3')
provides=(paldump)
install=
source=(http://www.winki-the-ripper.de/share/dist/$pkgname-$pkgver.tar.gz)
md5sums=('09b72f2b54bac7821a1baf01ddbdd6f0')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  mkdir -p ${startdir}/pkg/usr/bin
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
