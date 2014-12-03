# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=snpcc
pkgver=0.7
pkgrel=1
pkgdesc="A tool to estimate the quality of a genome capture run on the Human Origins dataset. http://www.genetics.org/content/early/2012/09/06/genetics.112.145037"
realname="SNPCCv$pkgver.jar"
arch=('any')
url="http://it.inf.uni-tuebingen.de/?page_id=161"
license=('custom')
depends=('jre7-openjdk')
source=("http://www-ps.informatik.uni-tuebingen.de/software/eager/snpcc/SNPCCv${pkgver}.jar" "starter.sh" "http://www-ps.informatik.uni-tuebingen.de/software/eager/snpcc/390KPos")
noextract=("SNPCCv${pkgver}.jar")
md5sums=('ddbb31ba5cad8f813e92ccbaa87d4bd9' '977948f2fec53e3d0287afc8610d8bff' 'bdd59ef68edb7eb56f82495bb7afdb4e')

package() {
  install -Dm755 "${srcdir}/$realname" "${pkgdir}/opt/$pkgname/$realname"
  install -Dm755 "${srcdir}/starter.sh" "${pkgdir}/opt/$pkgname/starter.sh"
  install -Dm755 "${srcdir}/390KPos" "${pkgdir}/opt/$pkgname/390KPos"  
  install -Dm755 "${pkgdir}/opt/$pkgname/starter.sh" "${pkgdir}/usr/bin/${pkgname}"
}

