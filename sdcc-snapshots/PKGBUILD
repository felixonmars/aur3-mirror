# Contributor: Yannick Poirier <contact@yannickpoirier.fr>
pkgname=sdcc-snapshots
_pkgname=sdcc
pkgver=5470
_pkgdate=20090622
pkgrel=1
pkgdesc="SDCC, the portable optimizing compiler for 8051, DS390, Z80, HC08, and PIC microprocessors"
arch=('i686')
url="http://sdcc.sourceforge.net/"
license=("GPL")
groups=()
depends=()
makedepends=('gputils' 'flex' 'bison')
provides=()
conflicts=()
replaces=()
backup=()
install=
source=("http://sdcc.sourceforge.net/snapshots/sdcc-src/${_pkgname}-src-${_pkgdate}-${pkgver}.tar.bz2")
noextract=()
md5sums=(ab88fcd47ce1beb274eeb99ab265b6be)

build() {

	cd ${srcdir}/${_pkgname} 
	./configure --prefix="/usr"  
	make || return 1
	make DESTDIR=${pkgdir}/ install || return 1

}

