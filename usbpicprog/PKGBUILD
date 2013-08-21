# Maintainer: Techmeology <techmeology@techmeology.co.uk>
pkgname=usbpicprog
pkgver=0.6.0
pkgrel=1
pkgdesc="Software for a USB PIC Programmer"
arch=('any')
url="http://usbpicprog.org/"
license=('GPL')
depends=('wxgtk2.9')
conflicts=('usbpicprog-beta')
source=(http://sourceforge.net/projects/usbpicprog/files/usbpicprog-software/usbpicprog-$pkgver-software/usbpicprog-$pkgver.tar.gz/download)
md5sums=('45fd491f706bff0651d7bf90303422f4') #generate with 'makepkg -g'

build() {
  cd "$srcdir/usbpicprog-$pkgver"
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-2.9
  make
}

package() {
  cd "$srcdir/usbpicprog-$pkgver"
  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/doc"
}
