# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=jplay2
pkgver=20090628
pkgrel=1
pkgdesc="An ffmpeg & libsndfile command-line audio player that interacts via OSC."
arch=(i686 x86_64)
url="http://rg42.org/oss/jplay2/start"
license=('GPL')
depends=('jack' 'libquicktime' 'liblo')
source=("http://rg42.org/_media/oss/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('73db81369c70a4e2770c2631229a8b5a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
