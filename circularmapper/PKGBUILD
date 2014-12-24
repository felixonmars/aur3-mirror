# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=circularmapper
pkgver=0.9
pkgrel=2
pkgdesc="A BWA based method for enhanced circular genome mapping."
realnamecm="CircularGeneratorv${pkgver}.jar"
realnamerea="RealignSAMFilev${pkgver}.jar"
arch=('any')
url="http://it.inf.uni-tuebingen.de/?page_id=161"
license=('custom')
depends=('jdk7')
makedepends=('bwa')
source=("http://www-ps.informatik.uni-tuebingen.de/software/eager/circularmapper/CircularGeneratorv${pkgver}.jar" "http://www-ps.informatik.uni-tuebingen.de/software/eager/circularmapper/RealignSAMFilev${pkgver}.jar" "starterCG.sh" "starterRSF.sh")
noextract=("CircularGeneratorv${pkgver}.jar" "RealignSAMFilev${pkgver}.jar")
md5sums=('3327904863d32e8b8a10dcfadb8bb26f' '4d24a59275607ad43261b979abf37d0c' 'e7bedb6e3142b6f4c0f1ddd32567e3e1' '7ffa5541e95373b23fdf036d56901f90')

package() {
  cd "$srcdir"
  install -D -m755 "${srcdir}/$realnamecm" "${pkgdir}/opt/$pkgname/$realnamecm"
  install -D -m755 "${srcdir}/$realnamerea" "${pkgdir}/opt/$pkgname/$realnamerea"
  install -D -m755 "${srcdir}/starterCG.sh" "${pkgdir}/opt/$pkgname/starterCG.sh"
  install -D -m755 "${srcdir}/starterRSF.sh" "${pkgdir}/opt/$pkgname/starterRSF.sh"
  install -D -m755 "${pkgdir}/opt/$pkgname/starterCG.sh" "${pkgdir}/usr/bin/circulargenerator"
  install -D -m755 "${pkgdir}/opt/$pkgname/starterRSF.sh" "${pkgdir}/usr/bin/realignsamfile"
}

