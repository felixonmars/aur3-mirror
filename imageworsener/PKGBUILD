# Maintainer: holomorph

pkgname=imageworsener
pkgver=1.2.0
pkgrel=1
pkgdesc='Utility for processing PNG, JPEG, BMP, and WebP images'
arch=('i686' 'x86_64')
url="http://entropymine.com/imageworsener/"
license=('MIT')
depends=('libjpeg-turbo' 'libpng' 'libwebp' 'zlib')
source=("http://entropymine.com/imageworsener/$pkgname-$pkgver.tar.gz")
sha256sums=('97fdb1aafac7bc2339b2ce813071f0900de0b093b96ab1a99a43f9647afdfe35')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
