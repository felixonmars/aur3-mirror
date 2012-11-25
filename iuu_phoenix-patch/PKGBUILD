# Maintainer: Wessel Dirksen "p-we" <wdirksen at gmail dot com>
# Base code borrowed from sascng-linux3-patch package by Vaca
#
pkgdesc="Infinity USB Unlimited/Phoenix kernel patch"
pkgname=('iuu_phoenix-patch')
pkgrel=1
install=iuu_phoenix-patch.install
_basekernel=3.6
pkgver=${_basekernel}
license=('GPL')
depends=('linux>=3.6' 'linux<3.7')
makedepends=('linux-headers>=3.6' 'linux-headers<3.7')
arch=(i686 x86_64)
url="http://www.kernel.org"
source=(http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basekernel}.tar.bz2       	iuu_phoenix.patch)
md5sums=('575c735175532201f1bbd6ec99712b55'
         '77ebb8de1e83e249c019a9b482ea8101')

build() {
  cd ${srcdir}/linux-$_basekernel
  patch -p1 < ${srcdir}/iuu_phoenix.patch
  cd ${srcdir}/linux-$_basekernel/drivers/usb/serial
  mkdir -p ${pkgdir}/lib/modules/`uname -r`/kernel/drivers/usb/serial/iuu_phoenix
  make -C /lib/modules/`uname -r`/build M=$(pwd) modules
  install -m0644 iuu_phoenix.ko $startdir/pkg/lib/modules/`uname -r`/kernel/drivers/usb/serial/iuu_phoenix
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

 
}

