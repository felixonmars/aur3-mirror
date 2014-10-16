# Maintainer: Patrik Votoček <patrik@votocek.cz>

pkgname=brother-mfc6490cw-lpr
pkgver=1.1.2_2
pkgrel=2
pkgdesc="Brother MFC-6490CW lpr drivers."
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL2' 'custom:brother')
depends=('lib32-glibc')
makedepends=('rpmextract')
optdepends=('brother-mfc6490cw-cups: cupswrapper.')
source=("http://www.brother.com/pub/bsc/linux/dlf/mfc6490cwlpr-${pkgver/_/-}.i386.rpm")
noextract=("mfc6490cwlpr-${pkgver/_/-}.i386.rpm")
md5sums=('9c7ad0e83d130f12ab8100a7c011a632')

prepare() {
	rpmextract.sh mfc6490cwlpr-${pkgver/_/-}.i386.rpm
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}/
}
