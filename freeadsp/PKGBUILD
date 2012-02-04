# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=freeadsp
pkgver=0.4.0
pkgrel=1
pkgdesc="MIDI-controlled real-time stereo effect rack using LV2 plugins."
arch=('i686' 'x86_64')
url="http://naspro.atheme.org/"
license=('GPL3')
depends=("naspro-core>=$pkgver" "gino-webkit-gtk>=$pkgver" 'lilv' 'hicolor-icon-theme')
install="$pkgname.install"
source=("http://download.sourceforge.net/project/naspro/naspro/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('e5dbf55357fbfd9c60faeb8ecd39eabb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
