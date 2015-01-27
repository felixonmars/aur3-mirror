# Contributer: N30N <archlinux@alunamation.com>

pkgname=gimp-plugin-hdrtools
pkgver=0.1
pkgrel=2
pkgdesc="load and save images in Radiance RGBE format, as well as supporting a few manipulation operations to the best of GIMP's ability (GIMP can only work with 8-bits per channel images)."
arch=("i686" "x86_64")
url="http://nifelheim.dyndns.org/~cocidius/hdrtools"
license=("GPL2")
depends=("gimp")
makedepends=("pkgconfig")
# source=("http://nifelheim.dyndns.org/~cocidius/files/gimp-hdrtools-${pkgver}.tar.bz2")
source=("http://ftp.vim.org/os/openindiana.org/dlc/oi/jds/downloads/sources/gimp-hdrtools-${pkgver}.tar.bz2")
md5sums=("8d14fd09b8672fc13395cbe17a8e382e")

build() {
	cd "${srcdir}/gimp-hdrtools-${pkgver}"
	msg "Starting build process."
	sed -r "/^(LIBS=)/s|$| -lm|" -i Makefile
	make
}

package() {
	cd "${srcdir}/gimp-hdrtools-${pkgver}"
	install -D -m755 hdrtools "${pkgdir}/usr/lib/gimp/2.0/plug-ins/hdrtools"
}

# vim: set noet ff=unix:
