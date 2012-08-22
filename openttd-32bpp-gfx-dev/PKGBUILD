# $Id: PKGBUILD 27781 2010-09-28 06:21:24Z tdziedzic $
# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Daniel J Griffiths (ghost1227 <at> archlinux <dot> us)
# Contributor: Vesa Kaihlavirta (vegai <at> iki <dot> fi)

pkgname=openttd-32bpp-gfx-dev
pkgver=2012_03_19
pkgrel=1
pkgdesc='Free 32bpp graphics set for openttd-32bpp'
arch=('any')
url='http://wiki.openttd.org/32bpp_Extra_Zoom_Levels'
license=('GPL')
depends=('openttd-32bpp')
source=("http://jupix.info/openttd/gfxdev-nightlies/files/32bit-gfx-nightly-megapack-${pkgver//_/-}-dev.tar")
noextract=("32bit-gfx-nightly-megapack-${pkgver//_/-}-dev.tar")
sha256sums=('928db19bbee7f0a16fcafcdc63d2db18f4ee0fe07fe3409e0bb7e7e4fd42d734')

package() {
	cd "${srcdir}"

	mkdir -pm0755 "${pkgdir}/usr/share/openttd-32bpp/data"
	install -m0644 *.tar "${pkgdir}/usr/share/openttd-32bpp/data/"
}
