#Maintainer: Gerhard Brauer <gerbra@archlinux.de>

pkgname=fwlanusb
pkgver=1.00
pkgrel=3
_kernver=2.6.24-ARCH
pkgdesc="AVM WLAN driver for FRITZ!USB stick. For stock arch 2.6 kernel."
arch=(i686)
license=('custom:"AVM"' 'LGPL')
url="http://www.avm.de"
depends=('kernel26>=2.6.23.8-2' 'kernel26<=2.6.24.4-1')
source=(ftp://ftp.avm.de/cardware/fritzwlanusb.stick/linux/suse.10.2/fwlanusb-1.00.00.tar.gz 2.6.24.patch)
md5sums=('ef8bd974cf20c1e9f2ffd182e6ed826c'
         '2146ade3369393df69faee1ba60de9ad')
install=fwlanusb.install

build() {
  cd $startdir/src/fritz/src
  # fix from Karsten Keil <kkeil@suse.de>
  # fixes a kernel OOPS, simple string copy operations are removed from kernel
  OBJ=$(find ../. -name '*lib.o')
  for i in $OBJ; do
    echo Patching $i ...
    mv $i $i.old
    objcopy -L memcmp \
            -L memcpy \
            -L memmove \
            -L memset \
            -L strcat \
            -L strcmp \
            -L strcpy \
            -L strlen \
            -L strncmp \
            -L strncpy \
    $i.old $i
  done

  patch -p2 -i ../../2.6.24.patch
  make LIBDIR=$startdir/pkg/var/lib/fritz KDIR=/lib/modules/${_kernver}/build all || return 1
  mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/net/wireless/avm/
  cp $startdir/src/fritz/src/fwlanusb.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/net/wireless/avm/
  rm -r $startdir/pkg/var/lib/fritz  
  # build module dependencies
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/fwlanusb.install
}

