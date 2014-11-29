# Maintainer: gborzi <gborzi@ieee.org>
pkgname=puma-em
_pkgname=Puma-EM
pkgver=0.6.3
pkgrel=1
pkgdesc="Computational electromagnetics software, MoM + MLFMM"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/puma-em/"
license=('GPL')
depends=('python-mpi4py' 'python-matplotlib' 'python-scipy' 'python-numpy' 'blitz' 'lapack' 'gmsh')
makedepends=('gcc-fortran' 'boost')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz $pkgname $pkgname.1 lapackgmsh.diff)
md5sums=('cc6ace40511085e848f1c4ebfaac3814'
         'ee7a546ba53625096c7eda43ef5b7037'
         '9b571b74b2230a47d3e3a2efea15af3d'
         'f5063afc2c4543185dd2b1419128d595')

prepare() {
	cd "$srcdir/$_pkgname"
      patch -Np1 -i "$srcdir/lapackgmsh.diff"
}

build() {
	cd "$srcdir/$_pkgname"
	make libs
}

check() {
	cd "$srcdir/$_pkgname"
	./run.sh
}

package() {
	cd "$srcdir/$_pkgname"

      install -dm755 "$pkgdir/usr/lib/puma-em/MoM"
      install -dm755 "$pkgdir/usr/share/puma-em"
      install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
      install -Dm644 "$srcdir/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
      install -Dm644 guide.pdf "$pkgdir/usr/share/doc/$pkgname/guide.pdf"
      rm -rf run_in_out/{__pycache__,result}
      cp -r config_mpi.sh my_hostfile run_in_out "$pkgdir/usr/share/puma-em/"
      cp code/*.py "$pkgdir/usr/lib/puma-em/"
      cp code/MoM/{mesh_cubes,RWGs_renumbering,mpi_mlfma,compute_Z_near,mesh_functions_seb,distribute_Z_cubes,compute_SAI_precond,communicateZnearBlocks} "$pkgdir/usr/lib/puma-em/MoM"
}
