# Maintainer: Aliaksandr Stelmachonak <mail.avatar@gmail.com>
pkgname=hpfall
pkgver=0.1
pkgrel=3
pkgdesc="HP 3D DriveGuard daemon for HP/Compaq laptops"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/ModemManager/ModemManager/"
license=('GPL2')
depends=('glibc')
source=('hpfall.c' 'hpfall.conf' 'hpfall')
md5sums=('a3c995c8806b410164d94b5a3cef4d57' 'eba598ff85391e7b800b6c52edb25843' '8047c9c8f517a22885ff814fbb898079')

build() {
  mkdir -p ${pkgdir}/usr/sbin
  gcc -o ${pkgdir}/usr/sbin/hpfall -Os hpfall.c
  install -m644 -D ${startdir}/hpfall.conf ${pkgdir}/etc/conf.d/hpfall
  install -m755 -D ${startdir}/hpfall ${pkgdir}/etc/rc.d/hpfall
}
 
