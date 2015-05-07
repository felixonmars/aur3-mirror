# Maintainer: Ales Rybak <ales.rybak@gmail.com>
pkgname=klnagent
pkgver=8.5.0_662
pkgrel=1
pkgdesc="Kaspersky Network Agent 8 for Linux"
url="http://support.kaspersky.com/kes8linux"
arch=('x86_64' 'i686')
license=('commercial')
depends=('perl' 'lib32-glibc') 
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=${pkgname}.install
source=(
	"http://products.kaspersky-labs.com/products/multilanguage/workstations/keslinux/${pkgname}-${pkgver//_/-}.i386.rpm"
	"${pkgname}.service"
)
md5sums=('0c9a8ac349e8c5d8185b67be9bdd9c44'
         'd7a087b3df6f4a36673ea56d7830a375')


build() {
	bsdtar xf ../${pkgname}-${pkgver//_/-}.i386.rpm
	rm klnagent-8.5.0-662.i386.rpm
}

package() {
	cp -r $srcdir/* $pkgdir

	mkdir -p "${pkgdir}/usr/lib/systemd/system"
	cp "${srcdir}/../klnagent.service" "${pkgdir}/usr/lib/systemd/system/"
}

