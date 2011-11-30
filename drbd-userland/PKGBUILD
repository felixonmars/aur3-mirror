# Contributor: Harald Ersch <harald@ersch.ro>
# Maintainer: Edvinas Valatka <edacval@gmail.com>
pkgname=drbd-userland
pkgver=8.4.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A userland tools for drbd block device which is designed to build high availability clusters." 
url="http://www.drbd.org"
license=('GPL')
options=(!distcc !makeflags)
depends=('linux' 'linux-headers' 'bash-completion')
optdepends=('ha-pacemaker: if you are planning to use the Pacemaker cluster resource manager' \
        'ha-heartbeat: if you are planning to use DRBD’s Heartbeat v1 resource agent or dopd')
replaces=('drbd')
source=(http://oss.linbit.com/drbd/8.4/drbd-$pkgver.tar.gz kernel-3.1.patch)
md5sums=('8519246dff4e2de14595d71abcd54db4'
         '1667cb931231d64b7b492951a5a5369c')
backup=('etc/drbd.conf' 'etc/rc.d/drbd')
install='drbd.install'
build() {
  cd $srcdir/drbd-$pkgver
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --with-km=no \
          --with-initdir=/etc/rc.d --with-utils=yes --with-bashcompletion=yes \
          --with-udev=yes --with-distro=generic
  patch -N -p1 -i ../../kernel-3.1.patch
  make DESTDIR=$pkgdir clean all install || return 1
  sed -i -e 's#/etc/init.d/drbd#/etc/rc.d/drbd#' $pkgdir/etc/rc.d/drbd || return 1
  chmod 1777 $pkgdir/var/lock 
}
