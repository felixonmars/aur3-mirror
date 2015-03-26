# Maintainer: Andreas Wagner (pointfree) <andreas.wagner@lowfatcomputing.org>
pkgname=lsuio
pkgver=0.2.0
pkgrel=1
pkgdesc='list available UIO modules'
arch=('i686' 'x86_64')
url='https://www.osadl.org/UIO-Archives.uio-archives.0.html'
license=('GPL2')
source=("https://www.osadl.org/uploads/media/${pkgname}-${pkgver}.tar.gz")
sha512sums=('55567b9028a22ae3058439135117d1537c972e875d864a1d7f6611f815461e17ecd6d953cc6abc129208241c1ba7fbeb9a2a62b5b9102a8429ccf270a93741f3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
