# Maintainer: Siôn Le Roux <sinisterstuf@gmail.com>

pkgname=ini4j
pkgver=0.5.2
pkgrel=1
pkgdesc="A simple Java API for handling configuration files in Windows .ini format."
url="http://ini4j.sourceforge.net/"
depends=('java-runtime')
arch=(any)
license=(Apache)
md5sums=('7be98dc3fedb40e8cbcc5f8b50ca6ff3')
source=("http://sourceforge.net/projects/ini4j/files/ini4j-bin/0.5.2/ini4j-0.5.2-bin.zip/download")

package() {
    install -Dm644 ${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
}
