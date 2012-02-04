# Contributor: Jeff Bailes <thepizzaking@gmail.com>
# Maintainer: Marco Maso <demind@gmail.com>

_kernver=$(uname -r)
pkgname=ov51x-jpeg-mm
pkgver=1.5.8
pkgrel=1
pkgdesc="Kernel26-mm Module with support for ov51x webcams (includes Sony eyeToy)"
arch=('i686' 'x86_64')
url="http://www.rastageeks.org/ov51x-jpeg/index.php/Main_Page"
license=('GPL')
depends=('kernel26>=2.6.19')
install=ov51x-jpeg.install
source=(http://www.rastageeks.org/downloads/ov51x-jpeg/ov51x-jpeg-$pkgver.tar.gz
	ov51x.patch
)
md5sums=('6186867485330c789ff2f457a70ddd44'
         'edfd13b28ee5bb789df41b71fe1384e3')
build() {
  cd $startdir/src/ov51x-jpeg-$pkgver
  patch -Np1 -i ../ov51x.patch
  #Change MakeFile to build for specified kernver
  sed -i -e "s/\$(shell uname -r)/${_kernver}/" $startdir/src/ov51x-jpeg-$pkgver/Makefile

  make || return 1

  #Install the Kernel module
  install -D -m644 ov51x-jpeg.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/media/video/usbvideo/ov51x-jpeg.ko
}

