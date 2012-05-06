# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Niel Drummond <niel.drummond@grumpytoad.org>

pkgname=joinpdf
pkgver=2.1
pkgrel=2
pkgdesc="A command-line tool to join and split PDF files"
arch=('any')
url="http://physweb.bgu.ac.il/DOWNLOADS/joinPDF/"
license=('GPL')
depends=('java-runtime')
source=("http://physweb.bgu.ac.il/DOWNLOADS/joinPDF/joinPDF${pkgver}.tgz")
md5sums=('457c40ea4eeb58dfcf1d69f9a87de6bd')

package() {
  cd "${srcdir}/joinPDF${pkgver}/install"

  # Fix launchers
  sed -i 's_java_"$JAVA\_HOME/bin/java"_' joinPDF splitPDF
  sed -i 's_/usr/lib_/usr/share/joinpdf_' joinPDF splitPDF

  # Install program files
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 joinPDF splitPDF "${pkgdir}/usr/bin"
  install -Dm644 PDF.jar "${pkgdir}/usr/share/${pkgname}/PDF.jar"

  # Install a readme file
  install -Dm644 ../README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
}
