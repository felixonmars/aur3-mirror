# Modified vhba-module PKGBUILD for bfs: ceceron <ceceron@gmail.com>

pkgname=vhba-module-bfs
_preffix=vhba-module
pkgver=1.2.1
_kernver='2.6.33-bfs'
pkgrel=7
pkgdesc="Kernel module that emulates SCSI devices. For kernel26-bfs."
arch=('i686' 'x86_64')
url="http://cdemu.sourceforge.net/"
license=('GPL2')
depends=('kernel26-bfs>=2.6.33' 'kernel26-bfs<2.6.34')
makedepends=('kernel26-headers>=2.6.33')
install=vhba-module-bfs.install
source=(http://downloads.sourceforge.net/cdemu/${_preffix}-$pkgver.tar.bz2)
md5sums=('a3b6ad798f2b72ef599df797ef79e5ec')

build() {
  cd "$srcdir/${_preffix}-$pkgver"
  #workaround to fix compilation against 2.6.33
  #http://bugs.gentoo.org/233910
  for i in kat/*.c; do
      sed -i "s:<linux/autoconf.h>:<generated/autoconf.h>:" $i
  done

  make -j1 KDIR=/usr/src/linux-${_kernver} || return 1
  install -D vhba.ko "$pkgdir/lib/modules/${_kernver}/extra/vhba.ko" || return 1
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" "$startdir/vhba-module.install"
}
