# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=eagerstat
pkgver=0.1
pkgrel=1
pkgdesc="A few tools for the EAGER Pipeline that produce important statistical output for the pipeline."
realnameMGRE="MergedReadExtractorv$pkgver.jar"
realnameMT="MTtoNucRatiov$pkgver.jar"
arch=('any')
url="http://it.inf.uni-tuebingen.de/?page_id=161"
license=('custom')
depends=('jre7-openjdk')
source=("http://www-ps.informatik.uni-tuebingen.de/software/eager/eagerstat/MTtoNucRatiov${pkgver}.jar" "http://www-ps.informatik.uni-tuebingen.de/software/eager/eagerstat/MergedReadExtractorv${pkgver}.jar" "starterMGRE.sh" "starterMTTONUC.sh")
noextract=("MTtoNucRatiov${pkgver}.jar" "MergedReadExtractorv${pkgver}.jar")
md5sums=('b244a845a221738e32af0d84e51a7108' '471dff9aefdc8efd6b42723971cc806c' 'e4b8f2c64553d72823126cbb8bfa8a0a' '1cf28ba7495a3c886fddb4861615d492')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/$realnameMT" "${pkgdir}/opt/$pkgname/$realnameMT"
  install -D -m755 "${srcdir}/$realnameMGRE" "${pkgdir}/opt/$pkgname/$realnameMGRE"
  install -D -m755 "${srcdir}/starterMGRE.sh" "${pkgdir}/opt/$pkgname/starterMGRE.sh"
  install -D -m755 "${srcdir}/starterMTTONUC.sh" "${pkgdir}/opt/$pkgname/starterMTTONUC.sh"
  install -D -m755 "${pkgdir}/opt/$pkgname/starterMGRE.sh" "${pkgdir}/usr/bin/MergedReadExtractor"
  install -D -m755 "${pkgdir}/opt/$pkgname/starterMTTONUC.sh" "${pkgdir}/usr/bin/mttonucratiocalculator"
}

