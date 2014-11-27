# Contributor: Marcel Pfeiffer <pfeiffer.marcel@gmx.de>
pkgname=dell_c3765dnf_drivers
pkgdesc="Linux cups printer driver for Dell C3765dnf Color Laser Printer"
url="http://ftp.dell.com/Browse_For_Drivers/Printers%20&%20Imaging%20Solutions/Printer/Dell%203130cn%20Color%20Laser%20Printer/"
pkgver=1.0
pkgrel=3
arch=('i686' 'x86_64')
license=('custom')
depends=('cups')
makedepends=('unzip' 'rpmextract')
source=('http://downloads.dell.com/FOLDER00620119M/1/Dell3765_Linux.zip')
md5sums=('1dead3bcc4bd4eb2d26d1ba24323c3c6')

build() {
	cd ${srcdir}
	rpmextract.sh Linux/Dell-C3765-Color-MFP-1.0-3.noarch.rpm
}

package() {
	cd ${srcdir}
	mv usr ${pkgdir}/
	chmod 755 ${pkgdir}/usr
}
