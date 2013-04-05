# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=java-jackson2-databind
pkgver=2.1.4
pkgrel=0
pkgdesc='Jackson Java JSON-processor 2.x Databind jars'
arch=('i686' 'x86_64')
url='http://fasterxml.com/'
license=('LGLP')
depends=('java-runtime')
source=("http://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/${pkgver}/jackson-databind-${pkgver}.jar")
md5sums=('315d2fafa9ce1eb4f9a3bcd610c0de85')

build() {
    install -d -m755 ${pkgdir}/usr/share/java/
    install -m755 \
        ${srcdir}/jackson-databind-${pkgver}.jar \
        ${pkgdir}/usr/share/java/jackson2-databind.jar
}
