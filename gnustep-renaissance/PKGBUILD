# Maintainer: spider-mario <spidermario@free.fr>
pkgname=gnustep-renaissance
pkgver=0.9.0
pkgrel=2
pkgdesc="GUI framework for GNUstep and Cocoa that runs on top of AppKit"
arch=('i686' 'x86_64')
url="http://www.gnustep.it/Renaissance/index.html"
license=('LGPL')
depends=('gnustep-gui')
optdepends=('gnustep-back')
changelog=ChangeLog
source=(http://www.gnustep.it/Renaissance/Download/Renaissance-$pkgver.tar.gz)
md5sums=('2209c96543ed0a03b1b8ee22bf3a8f35')

build() {
  cd "$srcdir/Renaissance-$pkgver"

  source /etc/profile.d/GNUstep.sh
  make
}

package() {
  cd "$srcdir/Renaissance-$pkgver"

  source /etc/profile.d/GNUstep.sh
  make DESTDIR="$pkgdir/" install
}
