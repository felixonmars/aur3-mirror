# Mantainer: StefanHamminga
#
# TODO: find a way to use GPG instead of sha256sum

pkgname=('amdmicrocode')
pkgdesc="Microcode update for AMD families 10h, 11h, 12h, 14h and 15h"
pkgver=1
pkgrel=1
arch=('i686' 'x86_64')

url="http://www.amd64.org/support/microcode.html"

depends=()
makedepends=()

license=('custom')
# options=(!libtool)
source=('license')

sha256sums=('afa599efada8b24d37e102eabe00ef32994cd58427e22b6452cf7d55a39beded')

package(){
	cd "${srcdir}"

	install -D -m644 license "${pkgdir}/usr/share/licenses/${pkgname}/license"

	if [ ! -f "amd-ucode-latest.tar" ]; then
		wget 'http://www.amd64.org/pub/microcode/amd-ucode-latest.tar'
	fi

	tar xf amd-ucode-latest.tar
	cd amd-ucode-*

	install -D -m500 microcode_amd.bin ${pkgdir}/usr/lib/firmware/amd-ucode/microcode_amd.bin
	install -D -m500 microcode_amd_fam15h.bin ${pkgdir}/usr/lib/firmware/amd-ucode/microcode_amd_fam15h.bin
}
