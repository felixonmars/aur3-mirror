# Maintainer: josephgbr <rafael.f.f1@gmail.com>
pkgname=wyslij-po
pkgver=2.2.1
pkgrel=1
pkgdesc="Submit PO files to the Translation Project"
arch=('i686' 'x86_64')
url="http://wyslij-po.software.gnu.org.ua/"
license=('GPL')
depends=('mailutils')
install=$pkgname.install
source=(ftp://download.gnu.org.ua/pub/release/$pkgname/$pkgname-$pkgver.tar.gz
        glibc-2.15.patch)
md5sums=('e9f7a1342a1d9c2ca9f645f1c079d330'
         '9ab8377373f64e1d13de95f33ad8d2df')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i ../glibc-2.15.patch
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
