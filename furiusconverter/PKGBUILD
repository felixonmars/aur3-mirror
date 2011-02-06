# Contributor: Tim Yang <tdy@gmx.com>
pkgname=furiusconverter
pkgver=0.2
pkgrel=1
pkgdesc="An ffmpeg wrapper for encoding Apple iPod and Sony PSP formats"
arch=('i686' 'x86_64')
url="http://www.marcus-furius.com/?page_id=6"
license=('GPL')
depends=('ffmpeg' 'mono')
makedepends=('pkgconfig')
source=(http://www.marcus-furius.com/files/FuriusConverter/$pkgname-$pkgver.tar.gz)
md5sums=('a92e592fa7ee553e335b30964cc7ea04')

build() {
  export MONO_SHARED_DIR="$srcdir/.wabi"
  install -dm755 "$MONO_SHARED_DIR"

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  rm -rf "$MONO_SHARED_DIR"
}
