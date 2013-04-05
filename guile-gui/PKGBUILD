# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=guile-gui
pkgver=0.3
pkgrel=1
pkgdesc="Guile Scheme code that aims to implement a graphical user interface"
arch=('i686' 'x86_64')
url="http://www.ossau.uklinux.net/guile/"
license=('LGPL')
depends=('guile')
source=(http://lmb.bioch.ox.ac.uk/coot/extras/$pkgname-$pkgver.tar.gz)
sha256sums=('6fddfd6774e8c05feecfb5bc373107bddf81999d23bdf0d25830661ef8b477f4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  make DESTDIR="$pkgdir/" install
} 
