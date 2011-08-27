# Contributor: andreas_baumann <abaumann at yahoo dot com>

pkgname=vdr-weather
pkgver=0.2.1e
pkgrel=1
pkgdesc="Displays current weather data in VDR (data comes from METAR)"
arch=('i686' 'x86_64')
url="http://www.moldaner.de/vdr/"
license=('GPLv2')
depends=('vdr>=1.5.0' 'ftplib>=3.1_1' 'mdsplib>=0.11')
makedepends=('gcc')
source=(http://www.moldaner.de/vdr/download/vdr-1.3-weather-$pkgver.tgz
        weather-0.2.1e-vdr-1.6.patch
        weather-0.2.1e-ftp-location.patch)
md5sums=('48642acc8a5dba51db297f4c4669a59b'
         '876f7018587dd136ce40fcaa66b676fc'
         'b129e25103d025ba1b8598e16544854a')

build() {

    cd $srcdir/weather-$pkgver

    patch -p1 < ../weather-0.2.1e-vdr-1.6.patch || return 1
    patch -p1 < ../weather-0.2.1e-ftp-location.patch || return 1

    sed -i 's/VDRVERSION/APIVERSION/g' Makefile

    mkdir -p $pkgdir/usr/lib/vdr
    mkdir -p $pkgdir/usr/src/VDR/locale

    make VDRDIR=/usr/src/VDR \
         LIBDIR=$pkgdir/usr/lib/vdr \
         LOCALEDIR=$pkgdir/usr/src/VDR/locale \
         PLUGINLIBDIR=$pkgdir/usr/lib/vdr clean || return 1

    make VDRDIR=/usr/src/VDR \
         LIBDIR=$pkgdir/usr/lib/vdr \
         LOCALEDIR=$pkgdir/usr/src/VDR/locale \
         PLUGINLIBDIR=$pkgdir/usr/lib/vdr all || return 1

}
