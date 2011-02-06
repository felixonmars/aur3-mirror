# Maintainer Filipp Andjelo <scorp@mailueberfall.de>

pkgname=jperf
pkgver=2.0.2
pkgrel=2
pkgdesc="Frontend for Iperf, network performance benchmark"
url="http://xjperf.googlecode.com"
depends=('java-runtime' 'iperf')
makedepends=('unzip')
arch=(any)
source=("${url}/files/${pkgname}-${pkgver}.zip" 
        "jperf.desktop" "jperf.sh")
license=('GPL')
md5sums=('5359ffbf9a788426c2ee309d41033d1e'
         '4ca6316eb56b001ba0b407c05e615ab3'
         '6d283fcc26bc0788bb4471c4f2305369')

build() {

    # Create directories
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/usr/share/${pkgname}
    install -d ${pkgdir}/usr/share/applications
#    install -d ${pkgdir}/usr/share/icons/hicolor/{128x128,48x48,32x32,16x16}/apps
#    install -d ${pkgdir}/usr/share/icons/locolor/{48x48,16x16}/apps

    # Copy files
    install -m644 ${srcdir}/${pkgname}-${pkgver}/lib/*.jar ${pkgdir}/usr/share/${pkgname}
    install -m644 ${srcdir}/${pkgname}-${pkgver}/*.jar ${pkgdir}/usr/share/${pkgname}
    install -m644 ${srcdir}/jperf.desktop ${pkgdir}/usr/share/applications/
    install -m755 ${srcdir}/jperf.sh ${pkgdir}/usr/bin/jperf
}

