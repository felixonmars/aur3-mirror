# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=usbip
pkgver=0.1.7
pkgrel=2
pkgdesc="A general USB device sharing system over IP network"
arch=('i686' 'x86_64')
url="http://usbip.sourceforge.net/"
license=('GPL')
depends=('sysfsutils' 'glib2')
options=('!libtool')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('d1094b6d4449787864f8be001639232c')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
