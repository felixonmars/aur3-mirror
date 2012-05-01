# Maintainer: Ivan Shapovalov <intelfx100 at gmail dot com>
pkgname=wimax-network-service
pkgver=1.5.2
pkgrel=2
pkgdesc="WiMAX Network Service"
arch=('i686' 'x86_64')
url="http://lists.linuxwimax.org/pipermail/wimax"
license=('custom')
depends=('libnl' 'libeap' 'wimax-tools' 'dhclient')
optdepends=('i2400m-firmware: for working with new intel 6x50 cards'
            'kernel26>=2.6.35: any kernel newer than 2.6.35 is required')
source=('ftp://ftp.be.debian.org/pub/linux/kernel/people/inaky/wimax-1.5.2.tar.bz2'
        'dhcp-renew.patch'
        'wimaxd.rc')

build() {
  cd ${srcdir}/wimax-${pkgver}
  ./configure --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man --prefix=/usr
  make
}

package() {
  cd ${srcdir}/wimax-${pkgver}
  make DESTDIR=${pkgdir} install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -Rf ${pkgdir}/etc/init.d
  cd ${pkgdir}
  patch -Np0 < ${srcdir}/dhcp-renew.patch
  mkdir -p ${pkgdir}/etc/rc.d
  cp ${startdir}/wimaxd.rc ${pkgdir}/etc/rc.d/wimaxd
  chmod +x ${pkgdir}/etc/rc.d/wimaxd
}
md5sums=('53454ddff3655c24f3801ec15a21f477'
         'ff5e6d2277a5d2f4f60f0b3b3afaeb38'
         '99464624d412261e48d26c514cb9b059')
