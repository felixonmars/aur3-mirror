# Syco <SycoLTH at gmail dot com>

pkgname=jakarta-commons-net
pkgver=2.2
pkgrel=0
pkgdesc="Jakarta Commons Net implements the client side of many basic Internet protocols."
arch=('i686' 'x86_64')
url="http://commons.apache.org/net/index.html"
license=('APACHE')
depends=('java-runtime')
source=(ftp://ftp-stud.fht-esslingen.de/pub/Mirrors/ftp.apache.org/dist/commons/net/binaries/commons-net-${pkgver}-bin.tar.gz)
md5sums=('9da0cd8e4d8d174eb08f5c9d3b9ec2ae')

build() {
    install -D -m644 ${startdir}/src/commons-net-${pkgver}/commons-net-${pkgver}.jar ${startdir}/pkg/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
    ln -s ${pkgname}-${pkgver}.jar ${startdir}/pkg/usr/share/java/${pkgname}/${pkgname}.jar
}
