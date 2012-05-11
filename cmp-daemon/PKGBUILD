# Contributor: mobitux <mobitux@googlemail.com>
pkgname=cmp-daemon
pkgver=0.21
pkgrel=1
pkgdesc="A daemon for Macbooks which controls the fan speed of Core duo CPUs"
arch=('i686' 'x86_64')
depends=('gcc')
license=('GPL2')
source=(cmp-daemon.c cmp-daemon.init)
install=INFO
url="http://wiki.archlinux.de/?title=Archlinux_auf_einem_Macbook_Pro_3.1"
md5sums=('58bf3f8cad06b0c58103e36dd490b676'
         '11ad809f112922b1ce7ee5e2ba1fa198')

build() {
  cd ${startdir}/src
  install -D -m755 cmp-daemon.init $startdir/pkg/etc/rc.d/cmp-daemon
  gcc -Wall cmp-daemon.c -o cmp-daemon || return 1
  install -D -m755 cmp-daemon $startdir/pkg/usr/sbin/cmp-daemon
}
