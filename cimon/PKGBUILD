# Maintainer: Daniel Milde <info@milde.cz>

pkgname=cimon
pkgver=0.4.1
pkgrel=2
pkgdesc="Lightweight load monitoring tool written in C"
arch=('i686' 'x86_64')
url="http://github.com/Dundee/Cimon"
license=('GPL')
depends=('rrdtool' 'libmicrohttpd')
makedepends=('cmake' 'cunit')
install='cimon.install'
source=(https://github.com/downloads/Dundee/Cimon/${pkgname}-${pkgver}.tar.gz
        cimon.rc
        cimon.conf)
md5sums=('613c3a40691ae73d94459089938fcd2a'
         'f118ae5c3469103b162583312aaaf400'
         '11ea0d51380414ef58d7bb5f327d4b7c')

build() {
    datadir=/var/lib/${pkgname}
    cd ${srcdir}/${pkgname}
    cmake -D DEBUG_MODE:BOOL=OFF -D DATA_DIR:PATH="\"${datadir}\"" -D REFRESH_GRAPH_INTERVAL:STRING="600" -D PORT:STRING="8080" .
    make
    
    install -D -m755 ${srcdir}/cimon/cimond ${pkgdir}/usr/sbin/cimond
    install -D -m644 ${srcdir}/cimon/cimon.conf ${pkgdir}/etc/cimon.conf
    install -D -m755 ${srcdir}/cimon.rc ${pkgdir}/etc/rc.d/cimon
    install -D -m644 ${srcdir}/cimon.conf ${pkgdir}/etc/conf.d/cimon
    
    install -d ${pkgdir}${datadir}
}
