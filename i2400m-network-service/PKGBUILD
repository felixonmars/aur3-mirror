pkgname=i2400m-network-service
pkgver=1.4.0
pkgrel=2
pkgdesc="Utilities for Intel Link 5xxx family WiMax devices"
arch=(i686 x86_64)
url="http://www.linuxwimax.org/"
license="BSD"
depends=('dhclient' 'libnl' 'i2400m-fw' 'i2400m-supplicant')
source=("http://www.linuxwimax.org/Download?action=AttachFile&do=get&target=WiMAX-Network-Service-${pkgver}.tar.bz2")
md5sums=('77b18c5cf5d6152104673e0d7c84eb83') 

build() {
#  cd ${srcdir}
#  tar xjf "${startdir}/Download?action=AttachFile&do=get&target=WiMAX-Network-Service-${pkgver}.tar.bz2"
  cd ${srcdir}/WiMAX-Network-Service-${pkgver}
  ./configure --with-i2400m=/usr/ --with-libnl1=/usr/include/netlink/ --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
  rm -r ${pkgdir}/etc/init.d
  mkdir ${pkgdir}/etc/rc.d ${pkgdir}/etc/conf.d
  cp ${startdir}/wimax.rc ${pkgdir}/etc/rc.d/wimax
  cp ${startdir}/wimax.conf ${pkgdir}/etc/conf.d/wimax
  chmod +x ${pkgdir}/etc/rc.d/wimax
}
