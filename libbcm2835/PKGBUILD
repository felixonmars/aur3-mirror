#Author: Arne Ko arneko {a t} yahoo . com

pkgname=libbcm2835
pkgver=20131121
pkgrel=1
pkgdesc="libbcm2835 to enable GPIO on Raspberry Pi"
arch=('any')
url="http://www.open.com.au/mikem/bcm2835/"
license=('MIT')
depends=('')
makedepends=()
options=('staticlibs')


build() {
  cd "$srcdir"
  msg "Connecting to server...."

  wget http://www.open.com.au/mikem/bcm2835/bcm2835-1.14.tar.gz
  tar xvzf bcm2835-1.14.tar.gz
  cd bcm2835-1.14
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"
  cd bcm2835-1.14
  make DESTDIR="$pkgdir" install
}

