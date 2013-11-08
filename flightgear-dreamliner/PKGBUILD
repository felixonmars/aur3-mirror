# Maintainer: blackleg <blackleg@lavabit.com>

pkgname=flightgear-dreamliner
pkgver=787
pkgrel=3
pkgdesc="Boeing 787-8 Dreamliner for FlightGear"
url="http://wiki.flightgear.org/Boeing_787-8_Dreamliner"
arch=('any')
license=('unknown')
depends=("flightgear" "flightgear-utils")
source=("flightgear-dreamliner.desktop" "https://gitorious.org/fg-boeing-787-8/fg-boeing-787-8-main/archive-tarball/stable_f")

md5sums=('a1e8199d9b93f2b79e44c1cd20b4f96e'
         'ee56caf3673592d226f87b36add1ac3f')


package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/flightgear/data/Aircraft"
	cp -r fg-boeing-787-8-fg-boeing-787-8-main	"${pkgdir}/usr/share/flightgear/data/Aircraft/787-8"
	mkdir -p "${pkgdir}/usr/share/applications"
	install -m 644 flightgear-dreamliner.desktop "${pkgdir}/usr/share/applications/"
	
	cd "${pkgdir}/usr/share/flightgear/data/Aircraft/787-8"

	mkdir -p "${pkgdir}/usr/share/icons"
	cp splash.png "${pkgdir}/usr/share/icons/787.png"
}
