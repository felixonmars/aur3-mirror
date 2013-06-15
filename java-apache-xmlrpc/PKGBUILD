# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=java-apache-xmlrpc
pkgver=3.1.3
pkgrel=2
pkgdesc='Java implementation of XML-RPC'
arch=('i686' 'x86_64')
url='http://ws.apache.org/xmlrpc/'
license=('APACHE')
depends=('java-runtime')
source=("http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/ws/xmlrpc/binaries/apache-xmlrpc-${pkgver}-bin.tar.gz")
md5sums=('046bbaa4779cdcf47f332bfdfdea7ad7')

build() {
    install -d -m755 ${pkgdir}/usr/share/java/apache-xmlrpc
    install -m755 \
        ${srcdir}/apache-xmlrpc-${pkgver}/lib/xmlrpc-client-${pkgver}.jar \
        ${pkgdir}/usr/share/java/apache-xmlrpc/xmlrpc-client.jar
    install -m755 \
        ${srcdir}/apache-xmlrpc-${pkgver}/lib/xmlrpc-common-${pkgver}.jar \
        ${pkgdir}/usr/share/java/apache-xmlrpc/xmlrpc-common.jar
    install -m755 \
        ${srcdir}/apache-xmlrpc-${pkgver}/lib/xmlrpc-server-${pkgver}.jar \
        ${pkgdir}/usr/share/java/apache-xmlrpc/xmlrpc-server.jar
    install -m755 \
        ${srcdir}/apache-xmlrpc-${pkgver}/lib/commons-logging-1.1.jar \
        ${pkgdir}/usr/share/java/apache-xmlrpc/commons-logging-1.1.jar
    install -m755 \
        ${srcdir}/apache-xmlrpc-${pkgver}/lib/ws-commons-util-1.0.2.jar \
        ${pkgdir}/usr/share/java/apache-xmlrpc/ws-commons-util-1.0.2.jar
}

