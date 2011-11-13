
# Maintainer: Stefano Facchini  <stefano.facchini@gmail.com>
pkgname=pixasso
pkgver=0.3
pkgrel=4
pkgdesc="PiXasso is an easy-to-use LaTeX snippet manager"
arch=('i686' 'x86_64')
url="http://pixasso.sourceforge.net/"
install=pixasso.install
license=('GPL3')
depends=('gtkmm3>=3.2.0' 'poppler-glib' 'hicolor-icon-theme')
makedepends=('intltool')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('70237f4ec415bae03252b39a24e5578f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

