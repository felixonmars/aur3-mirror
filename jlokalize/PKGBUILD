# Maintainer: Somebody <amr.hassan@gmail.com>
pkgname=jlokalize
pkgver=1.1
pkgrel=2
pkgdesc="i18n Editor for Java Projects"
url="http://jlokalize.sourceforge.net/"
arch=('any')
license=('GPLv3')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/project/jlokalize/version%20${pkgver}/JLokalize.jar" "jlokalize")

package() {
  install -Dm755 "${srcdir}/JLokalize.jar" "${pkgdir}/usr/share/java/${pkgname}/JLokalize.jar"
  
  install -Dm755 "jlokalize" "${pkgdir}/usr/bin/jlokalize"
}

md5sums=('cfa6650078679a3000726d0f3d705f2a'
         '7d0cc63b2004f246cfe879ec7817f148')
