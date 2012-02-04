# Maintainer: hydro <hydro@freenet.de>
# Contributor: niQo

pkgname=lmpcm_usb
pkgver=0.5.8
pkgrel=1
pkgdesc="Logitech MediaPlay Cordless Mouse USB Linux driver. It enables all multimedia keys such as Volume Up/Down, Play/Pause, Media, Track Back/ Forward, etc."
url="http://daemon.prozone.org/~david/projects/lmpcm_usb/"
license="GPL"
arch=('i686')
makedepends=('kernel26-headers')
install=$pkgname.install
source=(http://daemon.prozone.org/~david/projects/$pkgname/$pkgname-$pkgver.tar.gz
        lmpcm_usb-kernel_compatibility.patch)
md5sums=('4a862f3bc4a06cfd808defb680f8b455'
         '2f42738e65785ea5ccc92029f9df2302')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i ../lmpcm_usb-kernel_compatibility.patch
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  _kernelver=`uname -r`
  install -D -m644 lmpcm_usb.ko \
  $pkgdir/lib/modules/$_kernelver/misc/lmpcm_usb.ko
}
