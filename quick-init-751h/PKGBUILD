# Maintainer: Adriano Foschi <adriano.src@gmail.com>
# Patched by Alexis Cassaigne <ordiclic@ordiclic.eu> to support KMS

pkgname=quick-init-751h
pkgver=1.11
pkgrel=10.1
pkgdesc="Quick system bootup scripts for Archlinux, patched to enable KMS for Acer Aspire One 751h"
arch=('i686')
url="http://www.obliquo.net"
license=('GPL')
backup=(etc/inittab)
groups=('base')
install=quick-init.install
conflicts=('quick-init')
depends=('glibc' 'bash' 'awk' 'grep' 'coreutils' 'sed' 'udev>=139-1' 'net-tools' 'kbd' 'findutils' 'sysvinit' 'initscripts' 'kernel26-one-751h' 'v86d' '915resolution-static')
makedepends=('gcc' 'file' 'util-linux-ng')
source=(qinit.sysinit qinit.multi qinittab inittab.backup)

md5sums=('cdc0892771c1f9798aa6f3ee42122e84'
         '0a9c497691d5668cf6481cdda26bbe03'
         '74de6d866ce5d698118b54b34fae1716'
         '574273c77fff4954c8628418b5c8fc82')

build() {
  cd $srcdir
  install -D -m755 $srcdir/qinit.sysinit $pkgdir/etc/qinit.sysinit
  install -D -m755 $srcdir/qinit.multi $pkgdir/etc/qinit.multi
  install -D -m755 $srcdir/qinittab $pkgdir/etc/qinittab
  install -D -m755 $srcdir/inittab.backup $pkgdir/etc/inittab.backup
  
}

