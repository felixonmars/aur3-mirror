# Maintainer: Peter Dunne <pdunne2@gmail.com>
# Contributor: Peter Dunne <pdunne2@gmail.com>
pkgname=quantum-espresso-examples
pkgver="4.3.2"
pkgrel="1"
pkgdesc="Example input files for Quantum ESPRESSO. Quantum ESPRESSO is an integrated suite of computer codes for electronic-structure calculations and materials modeling at the nanoscale. It is based on density-functional theory, plane waves, and pseudopotentials (both norm-conserving and ultrasoft)."
depends=(quantum-espresso)
license=('GPLv2')
arch=('i686' 'x86_64')
source=(http://qe-forge.org/frs/download.php/169/espresso-$pkgver-examples.tar.gz)
url="http://www.quantum-espresso.org"
md5sums=('abfcf2c33da3caa3d871a183c621c0fd')

build() {
	cd $startdir/src/espresso-$pkgver

	mkdir -p $startdir/pkg/usr/share/doc/quantum-espresso/examples
	cp -R * $startdir/pkg/usr/share/doc/quantum-espresso/examples
	
}

