# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=gtinsms
pkgver=1.2.1
pkgrel=1
pkgdesc="A GUI front-end to TinSms"
arch=('i686' 'x86_64')
url="http://www.marzocca.net/linux/gtinsms.html"
license=('GPL')
depends=('gtk2-perl' 'perl-libwww')
source=(http://www.marzocca.net/linux/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('502f7d2c9606d27243d39ca55949cc53')

build() {
  cd ${srcdir}
  install -D -m755 gtinsms ${pkgdir}/usr/bin/gtinsms
}
