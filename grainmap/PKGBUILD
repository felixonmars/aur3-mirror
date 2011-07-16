# Maintainer: Caleb Reach <jtxx000@gmail.com>
pkgname=grainmap
pkgver=0.1
pkgrel=1
pkgdesc="interactive audio slicer"
arch=(x86 x86_64)
url="http://codphilosophy.com/software"
license=('GPL3')
depends=(libsndfile aubio libsamplerate aubio jack gtkmm3 cairomm)
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('e371c661da6e5dfedc32c9d768bc37a8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
