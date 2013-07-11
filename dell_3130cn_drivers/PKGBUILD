# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
pkgname=dell_3130cn_drivers
provides="dell_3130cn_drivers"
pkgdesc="Linux cups printer driver for Dell 3130cn Color Laser Printer"
url="http://ftp.dell.com/Browse_For_Drivers/Printers%20&%20Imaging%20Solutions/Printer/Dell%203130cn%20Color%20Laser%20Printer/"
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
license=('custom')
depends=('cups')
makedepends=('rpmextract')
source=('http://ftp.dell.com/printer/Dell-3130cn-Color-Laser-1.1-1.noarch.rpm')
sha1sums=('fddacbd08eee7843590b7433fde15974a6093726')

package() {
	cd ${pkgdir}
    rpmextract.sh ${srcdir}/Dell-3130cn-Color-Laser-1.1-1.noarch.rpm
}

