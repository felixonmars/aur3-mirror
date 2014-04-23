# Maintainer: Avi Knoll <gz.ajknoll from gmail dot com>

pkgname=maven-3.0.5
pkgver=3.0.5
pkgrel=1
pkgdesc="Maven 3.0.5"
depends=('java-environment')
source=('http://mirror.mel.bkb.net.au/pub/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz')
license=('Apache')
arch=('any')
url="http://maven.apache.org"
md5sums=('94c51f0dd139b4b8549204d0605a5859')

package() {
    install -d ${pkgdir}/opt/${pkgname}
    mkdir -p ${pkgdir}/usr/bin
    cp -r ${srcdir}/apache-maven-${pkgver}/* ${pkgdir}/opt/${pkgname}/
    ln -s /opt/${pkgname}/bin/mvn ${pkgdir}/usr/bin/mvn-3.0.5
}
