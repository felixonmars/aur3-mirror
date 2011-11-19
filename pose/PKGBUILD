# Maintainer: Chuan Ji <jichuan89@gmail.com>
pkgname=pose
pkgver=3.5
_pkgver=3.5-r2
_dataver=3.5-r1
pkgrel=4
epoch=
pkgdesc='Palm OS Emulator'
arch=('i686' 'x86_64')
url='http://code.google.com/p/pose-mod/'
license=('GPL')
depends=('fltk')
makedepends=()
install=('pose.install')
source=("http://pose-mod.googlecode.com/files/pose-mod-$_pkgver.tar.gz"
        "http://pose-mod.googlecode.com/files/pose-mod-data-$_dataver.tar.gz")
md5sums=('159336e0d39558f0b35cc9a5a0258629'
         '23b44418f9aa90bca5bc7d25562d1762')

build() {
  cd "$srcdir/pose-mod-$_pkgver/BuildUnix"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/pose-mod-$_pkgver/BuildUnix"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/pose"
  cd "$srcdir/pose-mod-$_pkgver/ROMTransfer/Source"
  cp ROM_Transfer.prc "$pkgdir/usr/share/pose"
  install -m755 ROM_Transfer "$pkgdir/usr/bin/ROM_Transfer"
  cp -r "$srcdir/pose-mod-data-$_dataver/"* "$pkgdir/usr/share/pose/"
}
