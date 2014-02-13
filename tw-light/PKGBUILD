# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Yury Siamashka <yurand2@gmail.com>

pkgname=tw-light
pkgver=0.4
pkgrel=2
pkgdesc="Clone/Sequel to the epic cross-genre game Star Control II"
arch=('i686' 'x86_64')
license=('GPL')
url="http://tw-light.appspot.com"
depends=('allegro4')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-allegro4')
  makedepends=('gcc-multilib')
fi
source=("http://tw-light.googlecode.com/files/$pkgname-$pkgver.tar.xz")
sha256sums=('d802c9ff5449672505fb4c987c46c03882231ccc696e089f9c2d7ef031298903')

build() {
  cd $pkgname-$pkgver

  # set multilib compiler
  if [ "$CARCH" == "x86_64" ]; then
    export CC="gcc -m32"
    export CXX="g++ -m32"
  fi
  ./configure --prefix=/usr
  make
}
package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
