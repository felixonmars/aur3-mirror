# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=java-jackson2-annotations
pkgver=2.1.4
pkgrel=0
pkgdesc='Jackson Java JSON-processor 2.x Annotations jars'
arch=('i686' 'x86_64')
url='http://fasterxml.com/'
license=('LGLP')
depends=('java-runtime')
source=("http://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/${pkgver}/jackson-annotations-${pkgver}.jar")
md5sums=('5996593d0367d2cf8b401db5ba9018d3')

build() {
    install -d -m755 ${pkgdir}/usr/share/java/
    install -m755 \
        ${srcdir}/jackson-annotations-${pkgver}.jar \
        ${pkgdir}/usr/share/java/jackson2-annotations.jar
}
