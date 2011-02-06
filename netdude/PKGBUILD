# Maintainer: Sébastien Duquette <ekse.0x@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=netdude
pkgver=0.5.1
pkgrel=1
pkgdesc="Netdude is the NETwork DUmp data Displayer and Editor for tcpdump tracefiles"
arch=('i686' 'x86_64')
license=('custom')
depends=('libnetdude>=0.12' 'gtk' 'fam')
source=("http://downloads.sourceforge.net/netdude/${pkgname}-${pkgver}.tar.gz")
url="http://netdude.sourceforge.net/"
md5sums=('a660402e2f3feb605c3efdd69e79dcc2')

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
