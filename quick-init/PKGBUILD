# Maintainer: Adriano Foschi <adriano.src@gmail.com>

pkgname=quick-init
pkgver=1.11
pkgrel=10
pkgdesc="Quick system bootup scripts for Archlinux"
arch=('i686' 'x86_64')
url="http://www.obliquo.net"
license=('GPL')
backup=(etc/inittab)
groups=('base')
install=quick-init.install
conflicts=('quick-init<1.3-1')
depends=('glibc' 'bash' 'awk' 'grep' 'coreutils' 'sed' 'udev>=139-1' 'net-tools' 'kbd' 'findutils' 'sysvinit' 'initscripts')
makedepends=('gcc' 'file' 'util-linux-ng')
source=(qinit.sysinit qinit.multi qinittab inittab.backup)

build() {
  cd $srcdir
  install -D -m755 $srcdir/qinit.sysinit $pkgdir/etc/qinit.sysinit
  install -D -m755 $srcdir/qinit.multi $pkgdir/etc/qinit.multi
  install -D -m755 $srcdir/qinittab $pkgdir/etc/qinittab
  install -D -m755 $srcdir/inittab.backup $pkgdir/etc/inittab.backup
}

md5sums=('1677308b552c278296dd9d1d77038b8d'
         '8d6da061c931de09ff3d3868bc7fdf7f'
         '74de6d866ce5d698118b54b34fae1716'
         '574273c77fff4954c8628418b5c8fc82')
