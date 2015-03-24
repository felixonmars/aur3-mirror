# Maintainer: Eddy <e.pedroni91 at gmail>
# Contributor: schuay <jakob.gruber@gmail.com>

pkgname=easymock
pkgver=3.3.1
pkgrel=1
pkgdesc="A library that provides an easy way to use Mock Objects for given interfaces or classes."
arch=('any')
url="http://easymock.org/"
license=('Apache')
depends=('java-environment')
source=("http://downloads.sourceforge.net/project/easymock/EasyMock/${pkgver}/easymock-${pkgver}.zip")
md5sums=('1de5f5f375b58648c6e2c71bd9d99e40')

package() {
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/${pkgname}-${pkgver}.jar \
    "${pkgdir}"/usr/share/java/${pkgname}-${pkgver}.jar
  
  ln -s /usr/share/java/${pkgname}-${pkgver}.jar \
    "${pkgdir}"/usr/share/java/${pkgname}.jar
}


