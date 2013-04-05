# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=java-jackson2-core
pkgver=2.1.4
pkgrel=0
pkgdesc='Jackson Java JSON-processor 2.x Core jars'
arch=('i686' 'x86_64')
url='http://fasterxml.com/'
license=('LGLP')
depends=('java-runtime')
source=("http://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/${pkgver}/jackson-core-${pkgver}.jar")
md5sums=('0aeb4800fff8a5c6711c2b8927485631')

build() {
    install -d -m755 ${pkgdir}/usr/share/java/
    install -m755 \
        ${srcdir}/jackson-core-${pkgver}.jar \
        ${pkgdir}/usr/share/java/jackson2-core.jar
}
