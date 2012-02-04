# Maintainer: OK <ok100.ok100.ok100@gmail.com>

pkgname=eeepc-linux-ck
pkgver=0.2
pkgrel=4
pkgdesc="eeepc-linux is a kernel module that allows control of the fan and fsb speeds. For linux-eee-ck."
arch=('i686')
url="http://code.google.com/p/eeepc-linux/"
license=('GPL')
makedepends=('pkgconfig' 'linux-eee-ck-headers')
install="eeepc-linux.install"
source=(http://eeepc-linux.googlecode.com/files/eeepc-linux-$pkgver.tar.gz
        eeepc-linux-$pkgver-kernel2.6.39.patch
        eeepc-linux_search_adapter.patch)

build() {
  cd $srcdir
  patch -Np1 < eeepc-linux-$pkgver-kernel2.6.39.patch
  cd eeepc-linux/module
  patch < $srcdir/eeepc-linux_search_adapter.patch
  make || return 1
  install -Dm644 $srcdir/eeepc-linux/module/eee.ko $pkgdir/lib/modules/$(uname -r)/kernel/acpi/eee.ko || return 1
}

md5sums=('7d13ee1f5f0a533ef4b7694823dda06f'
         '30a416c438557907c4dac3393ac2d39b'
         '11c863dd4ddb64f7ff7a38ce47018803')
