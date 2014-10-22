# Maintainer: Techmeology <techmeology@techmeology.co.uk>
pkgname=usbpicprog-beta
pkgver=140617
pkgrel=1
pkgdesc="Software and firmware for the USB PIC Programmer: usbpicprog"
arch=('i686' 'x86_64')
url="http://usbpicprog.org/"
license=('GPL')
depends=('wxgtk2.9')
conflicts=('usbpicprog')
source=(http://usbpicprog.org/downloads/usbpicprog-$pkgver.tar.gz)
md5sums=('050d21aae3d22409d1dc067f6e0cb216') #generate with 'makepkg -g'

build() {
  cd "$srcdir/usbpicprog-$pkgver"
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-2.9
  make
}

package() {
  cd "$srcdir/usbpicprog-$pkgver"
  make DESTDIR="$pkgdir/" install
}
