# Contributor: Christoph Siegenthaler < csi@gmx.ch >
# Contributor: Thomas Dziedzic

pkgname=elmer_meshgen2d
pkgver=5.0.0
pkgrel=4
pkgdesc='Elmer is a simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver.'
url='http://www.csc.fi/elmer/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs' 'bash')
source=("ftp://ftp.funet.fi/pub/sci/physics/elmer/src/meshgen2d-$pkgver.tar.gz"
        'elmermesh2d'
        'mesh2d'
        'MGError.patch'
        'main.patch'
        'PQ.patch')
md5sums=('822b902808dfd9956eccfe5d062c4121'
         'e5e6fe6842db687b5874f80aff91b7d8'
         '0f1ee5bf9663844068e8e77657448779'
         '0debdf3c74592d69250b7818955c817f'
         '6f6199d1baae818905b655460f0daf54'
         'a23362b956a176305d5ec34bff533ad6')

build() {
       patch -Np0 < ../MGError.patch
       patch -Np0 < ../main.patch
       patch -Np0 < ../PQ.patch

	cd meshgen2d-$pkgver

	./configure --prefix=/opt/elmer || return 1

	make || return 1

	make DESTDIR="$pkgdir" install || return 1
	install -D -m755 "$srcdir/elmermesh2d" "$pkgdir/usr/bin/elmermesh2d"
	install -D -m755 "$srcdir/mesh2d" "$pkgdir/usr/bin/mesh2d"
}
