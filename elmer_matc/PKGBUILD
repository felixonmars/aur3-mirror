# Contributor: Christoph Siegenthaler < csi@gmx.ch >
# Contributor: Thomas Dziedzic

pkgname=elmer_matc
pkgver=5.4.0
pkgrel=1
pkgdesc='Elmer is a simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.csc.fi/elmer/'
depends=('tcsh' 'readline')
source=("ftp://ftp.funet.fi/pub/sci/physics/elmer/src/matc-$pkgver.tar.gz"
        'matc')
md5sums=('8c78cea7c08ead946eb289a7ef750fd6'
         '19d610f3f1f9bb892c3424cddd70d157')

build(){
	cd matc-$pkgver

	./configure --prefix=/opt/elmer || return 1

	make || return 1

	make DESTDIR="$pkgdir" install || return 1
	install -D -m755 "$srcdir/matc" "$pkgdir/usr/bin/matc"
}
