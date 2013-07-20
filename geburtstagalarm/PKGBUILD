#Maintainer: Hans - Peter Meyer <hp.meyer at yahoo.de>
pkgname=geburtstagalarm
pkgver=1.0
pkgrel=1
pkgdesc="Under Construction - A Programm that remember birthday"
url="http://cyberdog86.de"
arch=('any')
license=('GPL')
depends=('java-environment')
source=("http://cyberdog86.de/Software/${pkgname}/${pkgver}/${pkgname}.jar"
		"http://cyberdog86.de/Software/${pkgname}/${pkgver}/${pkgname}.sh")
md5sums=('c328aed0a7c1a9c7900f7d7957a1b4d7'
         'c66b835b09ee4e4ebd7ef32758f4df4e')




build() {
	rm -rf ${srcdir}/${pkgname}-${pkgver}
    mkdir ${srcdir}/${pkgname}-${pkgver}
}

package () {
	#install jar file
	install -Dm644 ${pkgname}.jar "${pkgdir}"/usr/share/java/${pkgname}.jar

	# install launcher
	install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
}
