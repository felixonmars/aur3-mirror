# Author: Adhi Kerta
# Maintainer: archit3x <archit3x@gmail.com>

pkgname=balabali
pkgver=1
pkgrel=0
pkgdesc="Balinese Calendar"
url="http://www.balabali.com/balabali-kalender"
license=('LGPL')
arch=('any')
source=(https://dl.dropbox.com/s/k6x73dsif9csmjk/BalaBali%20Kalender%201.0.tar.lzma
        $pkgname.desktop)
md5sums=('77999f84743f3e5f92c23731a9c76e9e'
         '257be2ab01c8a4e12c8c922a5b649a5e')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/opt
  cp -r BalaBali_Kalender_1.0 $pkgdir/opt
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 "$srcdir/BalaBali_Kalender_1.0/AppIcon.png" $pkgdir/usr/share/pixmaps/$pkgname.png
}
