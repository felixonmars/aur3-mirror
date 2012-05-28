# $Id: PKGBUILD 27781 2010-09-28 06:21:24Z tdziedzic $
# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Daniel J Griffiths (ghost1227 <at> archlinux <dot> us)
# Contributor: Vesa Kaihlavirta (vegai <at> iki <dot> fi)

pkgname=openttd-32bpp-gfx
pkgver=2012_03_19
pkgrel=1
pkgdesc='Free 32bpp graphics set for openttd-32bpp'
arch=('any')
url='http://wiki.openttd.org/32bpp_Extra_Zoom_Levels'
license=('GPL')
depends=('openttd-32bpp')
source=("http://jupix.info/openttd/gfxdev-nightlies/files/32bit-gfx-nightly-megapack-${pkgver//_/-}.tar")
noextract=("32bit-gfx-nightly-megapack-${pkgver//_/-}.tar")
sha256sums=('4ba98b16fd8738038097b6550300c8a43ed308bd4dff4cc9f249cb442843b4aa')

package() {
	cd "${srcdir}"

	mkdir -pm0755 "${pkgdir}/usr/share/openttd-32bpp/data"
	install -m0644 *.tar "${pkgdir}/usr/share/openttd-32bpp/data/"
}
