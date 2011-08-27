# Maintainer: Wilfried Fauvel <wilfried.fauvel at gmail.com>

pkgname=java-jackson
pkgver=1.8.1
pkgrel=2
pkgdesc='Jackson Java JSON-processor'
arch=('i686' 'x86_64')
url='http://jackson.codehaus.org/'
license=('LGLP')
depends=('java-runtime')
source=("http://jackson.codehaus.org/1.8.1/jackson-all-${pkgver}.jar")
md5sums=('b538d961d204cac651e5d85e704d9c35')

build() {
    install -d -m755 ${pkgdir}/usr/share/java/
    install -m755 \
        ${srcdir}/jackson-all-${pkgver}.jar \
	${pkgdir}/usr/share/java/jackson-all.jar
}
