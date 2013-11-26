# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=jorgan
pkgver=3.20
pkgrel=1
pkgdesc="Lets you use your computer as a full featured virtual organ."
arch=('i686' 'x86_64')
url="http://jorgan.sourceforge.net"
license=('GPL3')
depends=('java-environment' 'fluidsynth')
provides=()
if test "$CARCH" == i686; then
 source=(http://sourceforge.net/projects/$pkgname/files/$pkgname-package/$pkgver/$pkgname\_$pkgver\_i386.deb)
 md5sums=('3841f13fc3414f0eec0717777423fc07')
else
 source=(http://sourceforge.net/projects/$pkgname/files/$pkgname-package/$pkgver/$pkgname\_$pkgver\_amd64.deb)
 md5sums=('83878cf4af30ef672e2b35db8286b597')
fi

build() {
  cd $srcdir
  tar -xzvf data.tar.gz
  mv -t $pkgdir usr
}

# vim:set ts=2 sw=2 et:
