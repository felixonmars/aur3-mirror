# Maintainer: Mateusz Herych <heniekk@gmail.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>
# Modified for fbcondecor: Xabre <Xabre_666@operamail.com>

pkgname=vhba-module-fbcondecor
pkgver=1.2.1
pkgrel=4
pkgdesc="Kernel module that emulates SCSI devices. For kernel26-fbcondecor."
_kernelver=2.6.32-fbcondecor
arch=('i686' 'x86_64')
url="http://cdemu.sourceforge.net/"
license=('GPL2')
depends=('kernel26-fbcondecor>=2.6.32' 'kernel26-fbcondecor<2.6.33')
provides=('vhba-module')
install=vhba-module.install
source=(http://downloads.sourceforge.net/cdemu/vhba-module-$pkgver.tar.bz2)
md5sums=('a3b6ad798f2b72ef599df797ef79e5ec')

build() {
  cd $startdir/src/vhba-module-$pkgver
  make KDIR=/usr/src/linux-$_kernelver || return 1
  install -D vhba.ko $startdir/pkg/lib/modules/$_kernelver/extra/vhba.ko || return 1
}
