# Maintainer: Wieland Hoffmann <the_mineo@web.de>
pkgname=wiipdf
pkgver=1.4
pkgrel=1
pkgdesc="Tiny program to call xpdf and control it using your wiimote"
arch=('i686' 'x86_64')
url="http://michael.stapelberg.de/wiipdf"
license=('BSD')
groups=()
depends=('xpdf' 'cwiid')
source=("http://michael.stapelberg.de/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=() #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('681937babcb6fa3518da4614d89896ac')
