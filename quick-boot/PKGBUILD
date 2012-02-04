# quick-boot
# Maintainer: ying <Jinoto Systems>
# Contributor: ying <Jinoto Systems>


pkgname=quick-boot
pkgver=1.3.1
pkgrel=1
pkgdesc="Quick system bootup scripts for Archlinux. Based on quick-init and readahead-fedora. Please read Wiki first before you install this!!"
arch=('i686' 'x86_64')
url="http://malisch-ts.de"
license=('GPL')
groups=('base')
install=quick-boot.install
conflicts=('quick-init')
replaces=('quick-init')
depends=('readahead-fedora' 'glibc' 'bash' 'awk' 'grep' 'coreutils' 'sed' 'udev>=139-1' 'net-tools' 'kbd' 'findutils' 'sysvinit' 'initscripts')
makedepends=('gcc' 'file' 'util-linux-ng')
source=(qinit.sysinit
qinit.multi
qinittab)


build() {
	cd $srcdir
	install -D -m755 $srcdir/qinit.sysinit $pkgdir/etc/qinit.sysinit
	install -D -m755 $srcdir/qinit.multi $pkgdir/etc/qinit.multi
	install -D -m755 $srcdir/qinittab $pkgdir/etc/qinittab
}





md5sums=('fb1bc3472f46ea8c84f57cc1780e446b'
         'd43912794499aa18088006d5c5bc8710'
         '5c7c3efb1b64ec507ea59f7eb3b852b9')
