pkgname=l2tpv3tun
pkgver=0.2
pkgrel=2
pkgdesc="Command line utility for configuring static L2TPv3 ethernet pseudowires"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.openl2tp.org/"
depends=(libnl)
source=(ftp://ftp.openl2tp.org/releases/${pkgname}-${pkgver}.tar.gz)
md5sums=('d3b4a9af652cca9f34d3eea4a7ff6041')

build() {
  cd $srcdir/${pkgname}-${pkgver}

  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}

  make DESTDIR=$pkgdir install

  install -D -m 644 README.txt ${pkgdir}/usr/share/doc/l2tpv3tun/README.txt
}
