# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=eager-reportengine
pkgver=0.5
pkgrel=1
pkgdesc="A report engine for the EAGER pipeline."
realname="Reportenginev$pkgver.jar"
arch=('any')
url="http://it.inf.uni-tuebingen.de/?page_id=161"
license=('custom')
depends=('jre7-openjdk')
source=("http://www-ps.informatik.uni-tuebingen.de/software/eager/reportengine/Reportenginev${pkgver}.jar" "starter.sh")
noextract=("Reportenginev${pkgver}.jar")
md5sums=('a08c5f347b4192f2ebf980f2301642bb' 'ee098124ff99c84f73e65bf7b64942e7')

package() {
  install -D -m755 "${srcdir}/$realname" "${pkgdir}/opt/$pkgname/$realname"
  install -D -m755 "${srcdir}/starter.sh" "${pkgdir}/opt/$pkgname/starter.sh"
  install -D -m755 "${pkgdir}/opt/$pkgname/starter.sh" "${pkgdir}/usr/bin/ReportTable"
}

