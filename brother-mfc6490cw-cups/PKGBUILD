# Maintainer: Patrik Votoček <patrik@votocek.cz>

pkgname=brother-mfc6490cw-cups
pkgver=1.1.2_2
pkgrel=1
pkgdesc="Brother MFC-6490CW CUPS drivers."
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL2' 'custom:brother')
depends=('brother-mfc6490cw-lpr' 'cups')
makedepends=('rpmextract')
optdepends=('brscan4: scanner support.')
install="${pkgname}.install"
source=( "http://www.brother.com/pub/bsc/linux/dlf/mfc6490cwcupswrapper-${pkgver/_/-}.i386.rpm")
noextract=("mfc6490cwcupswrapper-${pkgver/_/-}.i386.rpm")
md5sums=('904a456edbbb01fd8739f471c4faeba4')

prepare() {
	rpmextract.sh mfc6490cwcupswrapper-${pkgver/_/-}.i386.rpm
}

build() {
	sed -i -e 's$/etc/init.d/cups$/etc/rc.d/cupsd$g' -e 's$/etc/init.d$/etc/rc.d$g' "usr/local/Brother/Printer/mfc6490cw/cupswrapper/cupswrappermfc6490cw"
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}/
}
