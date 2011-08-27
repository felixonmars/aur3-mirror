# Maintainer: Eric Belanger <belanger@astro.umontreal.ca>

pkgname=rlab2
pkgver=2.2.9.5
pkgrel=1
pkgdesc="rlabplus (RLaB2) is a scripting environment for scientific computations."
url="http://rlabplus.sourceforge.net/index.html"
license="GPL"
arch=('i686')
depends=('gsl' 'termcap-compat' 'pgplot' 'blas' 'gcc-fortran' 'readline')
makedepends=('lapack')
source=(http://dl.sourceforge.net/sourceforge/rlabplus/rlab-$pkgver.tgz test.diff 579.diff coqual.diff parzen.diff)
md5sums=('c86ed35ebfc86e968126f43c3f9235da' '13be00dbaaa2b81cb235c9edf41bb1ad'\
         '4ae3e2fc79e0d12dc204426fabba6081' 'c60f93a4265bac1b11b8abc907acdf6d'\
         'fbf78cb357f2832301fa9cdf6a001265')

build() {
  cd $startdir/src/rlab-2.2.9

# Clean objects files/libs
  find . -name '*.o' -exec rm {} \;
  find . -name '*.a' -exec rm {} \;
  find . -name '*.so' -exec rm {} \;

  patch -p1 < ../parzen.diff || return 1
  patch -p1 < ../579.diff || return 1
  patch -p1 < ../coqual.diff || return 1
  patch -p1 < ../test.diff || return 1

  ./configure --prefix=/usr --with-pgplot=/usr/lib --enable-SUPERLU
  sed -i 's|/usr/local/lib|/usr/lib|' Makefile
  sed -i 's|./pgplot/|/usr/lib/|g' Makefile

  cd clibs
  for dir in cephes glpk harminv superlu ; do
    cd $dir; make LDFLAGS+=-lgfortran || return 1; cd ..
  done

  cd sprannlib/src
  ln -sf  ../../gc6.8 gc
  make || return 1; cd ../..

  cd umfpack
  for dir in AMD UMFPACK ;do
    cd $dir; make || return 1; cd ..
  done

  cd ../../flibs

  for dir in bacol clawpack contin genzpak hompack lapack loess minpack odebim odrpack slatec sparskit2; do
    cd $dir; make F77="gfortran -c" FORTRAN=gfortran G77=gfortran FC=gfortran || return 1; cd ..
  done

  cd arpack; make F77="gfortran -c" FORTRAN=gfortran G77=gfortran FC=gfortran lib || return 1; cd ../..

  make F77=gfortran G77=gfortran FCONV=-DUSE_F2C || return 1

# Equivallent of 'make check || return 1' without the need of the time package in [community]
  time ./rlab -qrl ./test.r || return 1

  make prefix=$startdir/pkg/usr INSTALL=/bin/install install
  chmod 644 $startdir/pkg/usr/lib/rlab-2.2.9/toolbox/spy.r
  sed -i -e "s|RROOT=\"$startdir/pkg/usr\"|RROOT=\"/usr\"|" $startdir/pkg/usr/bin/rlab2
}
