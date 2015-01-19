# Maintainer: Your Name <frankendres@tuxfamily.org>
pkgname=sgsearch
pkgver=1.1.7
pkgrel=1
pkgdesc="A simple GTK frontend for find and grep file search tools"
arch=('i686' 'x86_64')
url="http://sallu.tuxfamily.org/"
license=('CeCILL')
makedepends=('cmake')
source=(http://sallu.tuxfamily.org/IMG/bz2/$pkgname-$pkgver.tar.bz2)
md5sums=('30534eba8ea4cba0ae48f65845b7bfd4')

build() {
  cd $pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr\ 
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  mv -f "$pkgdir"/usr/doc "$pkgdir"/usr/share/
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/LICENSE-EN "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
