pkgname=ngsolve-svn
pkgver=2302
pkgrel=1
pkgdesc="NGSolve is a general purpose Finite Element Library on top of Netgen"
url="http://www.hpfem.jku.at/ngsolve/"
depends=('tcl' 'gcc-libs' 'netgen-svn' 'mumps' 'parmetis')
provides=('ngsolve')
conflicts=('ngsolve')
arch=('i686' 'x86_64')
license=('LGPL')
source=("svn://svn.code.sf.net/p/ngsolve/code/ngsolve")
md5sums=('SKIP')

pkgver() {
  cd ngsolve
  svnversion | tr -d [A-z]
}

prepare() {
  cd ngsolve
  # clapack.h conflicts with clapack from atlas-lapack    
#  mv basiclinalg/clapack.h basiclinalg/ngsolve_clapack.h
#  for _FILE in `grep -Rl "clapack.h" *`
#  do
#	sed -e "s|clapack.h|ngsolve_clapack.h|" \
#	    -i ${_FILE}
#  sed -e "s|ngsolve_ngsolve_ngsolve_ngsolve_clapack.h|ngsolve_clapack.h|" \
#      -i ${_FILE}
#  sed -e "s|ngsolve_ngsolve_clapack.h|ngsolve_clapack.h|" \
#      -i ${_FILE}
#  done
  # strange, seems a typo error!
#  sed -e "s|l      const FEL \& fel = static_cast<const FEL\&> (bfel);|      const FEL \& fel = static_cast<const FEL\&> (bfel);|" \
#      -i fem/diffop.hpp
}

build() {
  cd ngsolve
   autoreconf --install
  CPPFLAGS="-I/usr/include/python3.4m" CC=mpicc CXX=mpicxx ./configure --prefix=/usr --enable-parallel --enable-mumps
#   ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/ngsolve"

  make DESTDIR="${pkgdir}" install
}

