# UnpackFS: Installer: Arch
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Dmitry Stropaloff (helions8@gmail.com)

pkgname=unpackfs
pkgver=0.0.6
pkgrel=2
pkgdesc="A FUSE-based filesystem for the transparent unpacking of archives"
arch=("i686" "x86_64")
url="http://hepp.gmxhome.de/"
license=("GPL")
depends=("fuse")
source=(http://download.savannah.nongnu.org/releases/unpackfs/${pkgname}-${pkgver}.tar.gz)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	# Build
	./configure --prefix=${pkgdir}/usr --sysconfdir=${pkgdir}/etc || return 1
	make || return 1
	make install || return 1
}

sha1sums=('4f601d3ba7828f64b9569f35cacd6bd6c22aa239')
