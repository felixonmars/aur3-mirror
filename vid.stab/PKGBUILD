# Maintainer: EVorster <evorster@gmail.com>

pkgname=vid.stab
pkgver=0.98b
pkgrel=2
pkgdesc="Video stabilize library for fmpeg, mlt or transcode"
arch=('i686' 'x86_64')
url="http://public.hronopik.de/vid.stab"
license=('GPL')
depends=('glibc')
makedepends=('cmake')
provides=('vid.stab')
conflicts=('vid-stab')
source=('https://github.com/georgmartius/vid.stab/archive/release-0.98b.tar.gz')
md5sums=('SKIP')
 
build() {
  cd "$srcdir/$pkgname-release-$pkgver"
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}
 
package() {
  cd "$srcdir/$pkgname-release-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
