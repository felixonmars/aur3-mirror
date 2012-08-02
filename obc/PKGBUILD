# Maintainer: Jetbeard <jetbeard@gmail.com>
pkgname=obc
pkgver=2.9.2
pkgrel=2
pkgdesc="A compiler and debugger for the minimalistic imperative language Oberon-2."
arch=('i686' 'x86_64')
license=('BSD')
source=("http://spivey.oriel.ox.ac.uk/wiki/files/sw/$pkgname-linux-$pkgver.tar.gz" "LICENSE")
url="http://spivey.oriel.ox.ac.uk/corner/Oxford_Oberon-2_compiler"

build() {
  cd "$srcdir/$pkgname-linux-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  install -Dm664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$srcdir/$pkgname-linux-$pkgver"
  make prefix="$pkgdir/usr" install
}

md5sums=('97f44efb5d1999422c4bd9f74059d5d3'
         '374bb2047863322243b6dad7aca7c5e8')
