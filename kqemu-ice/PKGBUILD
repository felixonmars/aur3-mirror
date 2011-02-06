# Maintainer: Giuseppe Calderaro <giuseppecalderaro@gmail.com>

pkgname=kqemu-ice
_kernver=2.6.29-ice
pkgver=1.4.0pre1
pkgrel=1
pkgdesc="QEMU Accelerator Module, which adds virtualization capabilities to qemu. For kernel26-ice."
arch=('i686' 'x86_64')
license=('GPL' 'BSD')
url="http://fabrice.bellard.free.fr/qemu/"
depends=('kernel26-ice>=2.6.29' 'qemu>=0.9.0')
install=kqemu.install
source=(http://www.nongnu.org/qemu/kqemu-$pkgver.tar.gz LICENSE)

md5sums=('d738d8ca7332211ab716ec3213d82ee1'
         'ff53106a9b480cf2e43b189920e56c3e')

build()
{
  cd $startdir/src/kqemu-$pkgver
  
  ./configure --kernel-path=/lib/modules/${_kernver}/build
  make || return 1
  install -D -m644 kqemu.ko $startdir/pkg/lib/modules/${_kernver}/misc/kqemu.ko || return 1
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/kqemu.install
}
