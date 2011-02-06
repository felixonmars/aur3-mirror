# Contributor: Evgenij Vdovin <evdovin@pochta.ru>
pkgname=cdpolld
pkgver=1.1
pkgrel=1
pkgdesc="Tiny daemon for polling devices. Usefull for automount cdrom without HAL, DeviceKit, etc."
arch=(i686 x86_64)
license=('GPL')
url="http://www.archlinux.org"
depends=('coreutils')
backup=(etc/conf.d/cdpolld)
source=(cdpolld.rcd cdpolld.confd)
md5sums=('6690027bc28a9285aa18b372b4b14a10' 'c7ed296600590726091fca5d613346ec')
build(){
  cd $startdir/src
  install -D -m755 cdpolld.rcd $startdir/pkg/etc/rc.d/cdpolld
  install -D -m644 cdpolld.confd $startdir/pkg/etc/conf.d/cdpolld
}
