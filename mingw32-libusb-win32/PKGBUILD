# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=mingw32-libusb-win32
_pkgname=libusb-win32
pkgver=1.2.2.0
pkgrel=4
pkgdesc="Library to enable user space application programs to communicate with USB devices"
arch=('any')
depends=('mingw32-gcc' 'sh')
url="http://libusb.sourceforge.net/"
license=('LGPL')
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-bin-$pkgver.zip)
options=('!libtool')

build() {
  cd "$srcdir/$_pkgname-bin-$pkgver"
  
  _prefix=/usr/i486-mingw32

  install -d "$pkgdir/$_prefix/bin/$_pkgname-bin"
  install -d "$pkgdir/$_prefix/share/doc/$_pkgname"
  install -d "$pkgdir/$_prefix/include"
  install -d "$pkgdir/$_prefix/lib"

  install -m 755 bin/x86/libusb0_x86.dll "$pkgdir/$_prefix/bin/libusb0.dll"
  cp -a          bin/*                   "$pkgdir/$_prefix/bin/$_pkgname-bin"
  install -m 644 include/usb.h           "$pkgdir/$_prefix/include/usb.h"
  install -m 644 lib/gcc/libusb.a        "$pkgdir/$_prefix/lib/libusb.a"
  cp -a          *.txt examples          "$pkgdir/$_prefix/share/doc/$_pkgname"
}
md5sums=('594e4f1e273a8ed80c5847c487f7fa86')
