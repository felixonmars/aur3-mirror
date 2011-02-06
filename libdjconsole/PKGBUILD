# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=libdjconsole
pkgver=0.1.3
pkgrel=1
pkgdesc="A driver for the DJ Console"
license=('GPLv2')
options=('!libtool')
url="http://djplay.sourceforge.net/"
arch=('i686' 'x86_64')
depends=('libusb')
source=("http://downloads.sourceforge.net/project/djplay/libdjconsole/0.1.3/${pkgname}-${pkgver}.tar.gz")
md5sums=('66b073053cbe33e444705a0ba898b16f')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
