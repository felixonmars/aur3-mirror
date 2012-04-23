# Contributor: Alex Abbott <smartboyathome@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nted
pkgver=1.10.18
pkgrel=2 
pkgdesc="A user friendly WYSIWYG Music Notation program" 
arch=('i686' 'x86_64')
url="http://vsr.informatik.tu-chemnitz.de/staff/jan/nted/nted.xhtml" 
license=('GPL')
depends=('gtk2' 'alsa-lib')
makedepends=('gettext')
source=(http://vsr.informatik.tu-chemnitz.de/staff/jan/nted/sources/$pkgname-$pkgver.tar.gz)
md5sums=('0ca7aa23109171ab643a9b552487bd4b')

build() {
  cd $srcdir/$pkgname-$pkgver
  CPPFLAGS+="-fpermissive" ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
