#Maintainer: Sébastien Duquette <ekse.0x@gmail.com>
pkgname=libnetdude
pkgver=0.12
pkgrel=1
pkgdesc="Netdude is the NETwork DUmp data Displayer and Editor for tcpdump tracefiles"
arch=('i686' 'x86_64')
license=('custom')
url="http://netdude.sourceforge.net/"
depends=('glib' 'file' 'libpcapnav')
source=("http://downloads.sourceforge.net/netdude/${pkgname}-${pkgver}.tar.gz")
md5sums=('de5ebc5bcf2d93627c0e9648d48b8c9d')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
}

package() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  make DESTDIR=${startdir}/pkg install
  install -D -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
