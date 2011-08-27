# $Id: PKGBUILD 27781 2010-09-28 06:21:24Z tdziedzic $
# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Daniel J Griffiths (ghost1227 <at> archlinux <dot> us)
# Contributor: Vesa Kaihlavirta (vegai <at> iki <dot> fi)

pkgname=openttd-32bpp-gfx-extra
pkgver=40
pkgrel=1
pkgdesc='Free 32bpp graphics set for openttd-32bpp, extras'
arch=('any')
url='http://wiki.openttd.org/32bpp_Extra_Zoom_Levels'
license=('GPL')
depends=('openttd-32bpp')
source=("http://bundles.openttdcoop.org/32bpp-extra/nightlies/r${pkgver}/32bpp_extra-nightly-r${pkgver}.zip")
sha256sums=('07bb2bfa2be27d27fcc50e064405715211c7c801c97dc8612b2c47e6fd239d6d')

package() {
	cd "${srcdir}"

	mkdir -pm0755 "${pkgdir}/usr/share/openttd-32bpp/data"
	install -m0644 *.tar "${pkgdir}/usr/share/openttd-32bpp/data/"
}
