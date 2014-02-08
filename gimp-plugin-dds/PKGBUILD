# Maintainer: N30N <archlinux@alunamation.com>
# Contributer: J4913 <J49137@gmail.com>
# Contributer: Gero Müller <post@geromueller.de>

pkgname=gimp-plugin-dds
pkgver=3.0.1
pkgrel=1
pkgdesc="Allows you to load and save images in DirectDraw Surface (DDS) format."
arch=("i686" "x86_64")
url="http://code.google.com/p/gimp-dds/"
license=("GPL")
depends=("gimp>=2.8" "freeglut" "glew")
makedepends=("pkgconfig")
source=("http://gimp-dds.googlecode.com/files/gimp-dds-${pkgver}.tar.bz2")
md5sums=('19a0310e97b93d836beb3239fa0cbd63')

build() {
	cd "gimp-dds-${pkgver}"
	make
}

package() {
	install -Dm755 "gimp-dds-${pkgver}/dds" \
		"${pkgdir}/usr/lib/gimp/2.0/plug-ins/dds"
}

# vim: set noet ff=unix:
