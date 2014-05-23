# Maintainer: Никола "hauzer" Вукосављевић <hauzer@gmx.com>

pkgname=epsxe-bios-scph1001
pkgver=1001
pkgrel=1
pkgdesc='PSX BIOS file. Using it without owning the console is illegal.'
arch=('any')
url='http://www.emuparadise.me/biosfiles/'
license=('unknown')
depends=('epsxe')
install="${pkgname}.install"
source=('http://www.emuparadise.me/biosfiles/PSX_Bios_SCPH1001.zip')
sha512sums=('c31ed946988e84fe79bc737bd72db671ae39b17531f905e2edf6fd4110a0e3007431290532adc80240cfc8125e88843849758157bc897108428b28f6498e348c')

package() {
    install -m664 -D "${srcdir}/SCPH1001.BIN" "${pkgdir}/opt/epsxe/bios/scph1001.bin"
}

