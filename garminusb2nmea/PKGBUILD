# Contributor: Lex Rivera aka x-demon <aur@x-demon.org>                
# Maintainer: Lex Rivera aka x-demon <aur@x-demon.org>

pkgname=garminusb2nmea
pkgver=0.12a
pkgrel=1
pkgdesc="Garmin USB to NMEA protocol converter"
depends=()
source=("http://sourceforge.net/projects/garmin-gps/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
url="http://www.sourceforge.net/projects/garmin-gps"
md5sums=('c8d05234cf7b9685eb300b188896bb7c')
arch=('i686' 'x86_64')
license=('GPL')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
  mkdir -p ${pkgdir}/usr/bin
  install -D -m755 garminusb2nmea ${pkgdir}/usr/bin/
}
