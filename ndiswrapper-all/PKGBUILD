# Maintainer: Trent McPheron <twilightinzero@gmail.com>
# Based on package by Tobias Powalowski <tpowa@archlinux.org>

pkgname=ndiswrapper-all
pkgver=1.56
pkgrel=2
pkgdesc="Module for NDIS (Windows Network Drivers) drivers supplied by vendors. Builds for all detected kernels."
license=('GPL')
arch=(i686 x86_64)
url="http://ndiswrapper.sourceforge.net"
install="ndiswrapper-all.install"
depends=("ndiswrapper-utils=$pkgver" 'kernel26')
makedepends=('kernel26-headers')
provides=('ndiswrapper')
source=(http://downloads.sourceforge.net/sourceforge/ndiswrapper/ndiswrapper-$pkgver.tar.gz
        kernel-2.6.35.patch)
md5sums=('1431f7ed5f8e92e752d330bbb3aed333'
         '0a03d613b1fd545a75c5dd1a7c2aaec4')

build()
{
  cd $srcdir/ndiswrapper-$pkgver/driver
  patch -Np2 -i $startdir/kernel-2.6.35.patch
  
  # Loop through all detected kernels. Same way it's done in nvidia-all.
  for _kernver in `file /boot/* | grep 'Linux kernel.*boot executable' | grep 'vmlinuz' | sed 's/.*version \([^ ]\+\).*/\1/'`;
  do
    msg2 "Building module for $_kernver..."
    make KVERS=$_kernver || return 1
    make DESTDIR=$pkgdir KVERS=$_kernver install || return 1
    rm $pkgdir/lib/modules/$_kernver/modules.* #wtf?

    # move it to correct kernel directory
    mkdir -p $pkgdir/lib/modules/$_kernver/kernel/drivers/net/wireless/ndiswrapper
    mv $pkgdir/lib/modules/$_kernver/misc/* $pkgdir/lib/modules/$_kernver/kernel/drivers/net/wireless/ndiswrapper/
    rm -r $pkgdir/lib/modules/$_kernver/misc/
  done
}
