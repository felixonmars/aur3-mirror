# Maintainer: Michael Häsel <michael DOT haesel AT gmail DOT com>
# Contributor: Florian Walch <florian.walch@gmx.at>

pkgname=tum-jasmin
pkgver=1.5.8
pkgrel=1
pkgdesc="A Java x86 assembler interpreter."
arch=('any')
screenshot="http://www.lrr.in.tum.de/~jasmin/images/screenshot.png"
url="http://www.lrr.in.tum.de/~jasmin/"
license=('GPL')
depends=('java-runtime' 'sh')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/Jasmin-${pkgver}/Jasmin-${pkgver}.jar"
        "tum-jasmin")
sha256sums=('b449e9ec8d61948b96b8d6e9e6c8e465e4abfa6e59aa58104a1d97226ea486e4'
            '1546060fe3562d797884aa85aec01af5f44a189ac4e9f065041836b994822356')
            
package() {
  cd "${srcdir}"
  
  install -D Jasmin-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/Jasmin.jar"
  install -D tum-jasmin "${pkgdir}/usr/bin/tum-jasmin"
}
