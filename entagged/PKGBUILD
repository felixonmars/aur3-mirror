# Maintainer: David Glanzman <davidglanzman@yahoo.com>
pkgname=entagged
pkgver=0.35
pkgrel=1
pkgdesc="Open-source audio file tagger"
arch=('any')
url="http://entagged.sourceforge.net"
license=('GPL')
depends=('java-runtime>=1.4.1')
provides=('entagged')
install=""
source=(http://sourceforge.net/projects/entagged/files/Entagged/Entagged%20v%200.35/entagged.zip/download 'entagged.sh')
md5sums=('7cbf7716521ae26ba2c93810cf32deda' '2c6090bc5bb007d9e6d7dd30a99b7703') #generate with 'makepkg -g'

#build() {
#
#}
#
package() {
	cd ${srcdir}/
	install -d ${pkgdir}/usr/{bin,share/{licenses/${pkgname},doc/${pkgname},java/${pkgname}}}
	install -Dm755 entagged.sh ${pkgdir}/usr/bin/entagged
	install -Dm644 Entagged-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/entagged.jar
	install -Dm644 hsqldb.jar ${pkgdir}/usr/share/java/${pkgname}/hsqldb.jar
	install -Dm644 squareness.jar ${pkgdir}/usr/share/java/${pkgname}/squareness.jar
	cd docs/
	install -m644 -t ${pkgdir}/usr/share/doc/${pkgname}/ changelog.txt doc\ eng.pdf doc\ Fr.pdf readme.html
	install -m644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ license.txt squareness_license.txt
}
