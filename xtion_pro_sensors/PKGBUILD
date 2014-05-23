
# Maintainer: Luca Fulchir <luca@fulchir.it>

pkgname=xtion_pro_sensors
pkgver=5.1.0.41
pkgrel=1
pkgdesc="Xtion PRO linux drivers"
arch=('i686' 'x86_64')
url="http://support.asus.com/download.aspx?SLanguage=en&m=Xtion+PRO&os="
license=('GPL')
makedepends=('cdrkit' 'unrar')
install='xtion.install'
source=(http://dlm3cdnet.asus.com/pub/ASUS/MM/Xtion_Pro/V1049_0430.zip)
md5sums=('9f6fb5ff1341f3c4e7f14e835fdece93')

build() {
	if [ "$CARCH" == "x86_64" ]; then
		TMPARCH="x64"
	else
		TMPARCH="x32"
	fi
	isoinfo -i V1049_0430.iso -J -x "/SDK/Linux/Linux-${TMPARCH}-20.4.2.20.rar;1" > Linux.rar
	unrar x Linux.rar
	tar xjpvf Sensor-Bin-Linux-${TMPARCH}-v${pkgver}.tar.bz2
	# build ? wut is dat?
}

package() {
	if [ "$CARCH" == "x86_64" ]; then
		TMPARCH="x64"
	else
		TMPARCH="x32"
	fi

	mkdir -p ${pkgdir}/usr/local/Xtion_pro/
	cp -a Sensor-Bin-Linux-${TMPARCH}-v${pkgver} ${pkgdir}/usr/local/Xtion_pro/Sensor-Bin-Linux-${TMPARCH}-v${pkgver}-${pkgrel}
	# install? nah, just kidding. that shit needs to copy & register files.
	# it has its script for install/uninstall...sigh...
}


