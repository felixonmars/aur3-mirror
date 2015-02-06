# Maintainer: Romain Schmitz <slopjong _]at[_ slopjong _]dot[_ de

pkgname=itext
pkgver=5.5.4
pkgrel=2
pkgdesc="Java PDF library that allows you to CREATE, ADAPT, INSPECT and MAINTAIN documents in the Portable Document Format (PDF)."
arch=('i686' 'x86_64')
options=(!strip)
url="http://itextpdf.com"
license=('AGPL')
depends=('java-environment')
source=("http://softlayer-ams.dl.sourceforge.net/project/itext/iText/iText${pkgver}/itext-${pkgver}.zip")
sha256sums=('d4ddf4e5825f2c240641aaf3d7340cc7e6e2318576dc2f523b9da170df005c4f')

build() {
    :
}

package() {
  cd "${srcdir}"

  JAVA_DIR="${pkgdir}/usr/share/java/${pkgname}"

  install -d "${JAVA_DIR}"
  install -m755 *.jar "${JAVA_DIR}"

  ln -sr "$JAVA_DIR"/itextpdf-$pkgver.jar    "$JAVA_DIR"/itextpdf.jar
  ln -sr "$JAVA_DIR"/itext-xtra-$pkgver.jar  "$JAVA_DIR"/itext-xtra.jar
  ln -sr "$JAVA_DIR"/itext-pdfa-$pkgver.jar  "$JAVA_DIR"/itext-pdfa.jar
}

# vim:set ts=2 sw=2 et: