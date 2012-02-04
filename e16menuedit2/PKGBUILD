# Contributor: koltzoner <koltzoner@gmail.com>
pkgname=e16menuedit2
pkgver=0.0.3
pkgrel=1
pkgdesc="Graphical menu editor for the enlightenment window manager"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/enlightenment"
license=('GPL')
depends=(enlightenment gtk2)
source=(http://sourceforge.net/projects/enlightenment/files/e16menuedit/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('17f615997e47fb3831ae6dd1044ce0ef')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --localstatedir=/var --prefix=/usr \
  --sysconfdir=/etc 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
