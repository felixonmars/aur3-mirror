# Maintainer: Christian Berendt <berendt@b1-systems.de>

pkgname=nsia
pkgver=0.8.99
pkgrel=1
pkgdesc="The ThreatFactor NSIA is a website scanner that monitors websites in realtime in order to detect defacements, compliance violations, exploits, sensitive information disclosure and other issues."
url="http://threatfactor.com/Products/"
arch=('i686')
license=('custom:nsia')
depends=('jre' 'hd2u')
source=(http://downloads.sourceforge.net/project/nsia/nsia/${pkgver}/NSIA_No_Installer.zip)
md5sums=('5e30add82a1870aef0bb7113db2b9db9')

build() {
	cd $startdir/src

	mkdir -p ${pkgdir}/opt/${pkgname}/{bin,etc,lib,var}
	cp bin/nsia.jar ${pkgdir}/opt/${pkgname}/bin
	cp etc/{config.ini,mime.types} ${pkgdir}/opt/${pkgname}/etc
	cp -r lib/* ${pkgdir}/opt/${pkgname}/lib

	cd ${pkgdir}/opt/${pkgname}/etc
	dos2unix config.ini
	cd ${pkgdir}/opt/${pkgname}/bin
	/opt/java/bin/java -jar nsia.jar --install admin admin admin
}
