# Mantainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>
# Contributor: Jed Brown <jed@59A2.org>
pkgname=mpich2-gcc44
_gccver=4.4.6
pkgver=1.4
pkgrel=4
pkgdesc="An improved implementation of the Message Passing Interface."
url="http://www.mcs.anl.gov/research/projects/mpich2/"
arch=('i686' 'x86_64')
license="custom"
depends=(python2 gcc44=$_gccver libxml2)
makedepends=(libtool make coreutils)
conflicts=()
replaces=()
backup=()
install=install.mpich2
source=(http://www.mcs.anl.gov/research/projects/mpich2/downloads/tarballs/$pkgver/mpich2-$pkgver.tar.gz
	install.mpich2
	mpich2-gcc44.bash)
md5sums=('cf7f8c12161b0af3f111e33c6d15f5c6'
         '7e069551f63863bd0c6fa9e5a92c5eb8'
         'ba290c5794e153f2af5ad83456a8d5b3')
options=(!libtool)

build() {
  #fake the system to think gcc44 is the default
  ln -s /usr/bin/gcc-4.4 /tmp/gcc || true 
  ln -s /usr/bin/cpp-4.4 /tmp/cpp || true
  ln -s /usr/bin/g++-4.4 /tmp/g++ || true
  ln -s /usr/bin/gfortran-4.4 /tmp/gfortran || true
  export PATH=/tmp:$PATH
  [ "$CARCH" = "x86_64" ] && LIBGCC44=/usr/lib/gcc/x86_64-unknown-linux-gnu/${_gccver}/
  [ "$CARCH" = "i686" ] && LIBGCC44=/usr/lib/gcc/i686-pc-linux-gnu/${_gccver}/
  export LD_LIBRARY_PATH=$LIBGCC44:$LD_LIBRARY_PATH

  #starting real compilation
  cd ${srcdir}/mpich2-${pkgver}

  unset MAKEFLAGS # -j2 causes trouble, http://trac.mcs.anl.gov/projects/mpich2/ticket/955

  # CFLAGS etc are normally written into the wrapper compilers.  This
  # gives surprising results, e.g. when the user wants to compile their
  # program without optimization.
  export MPICH2LIB_CFLAGS="$CFLAGS";      unset CFLAGS
  export MPICH2LIB_CXXFLAGS="$CXXFLAGS";  unset CXXFLAGS
  export MPICH2LIB_FFLAGS="$FFLAGS";      unset FFLAGS
  export MPICH2LIB_F90FLAGS="$F90FLAGS";  unset F90FLAGS
  export MPICH2LIB_LDFLAGS="$LDFLAGS";    unset LDFLAGS

  #mkdir -p build
  #cd build
  #../configure --prefix=/opt/$pkgname --enable-shared --enable-sharedlibs=gcc \
  ./configure --prefix=/opt/$pkgname --enable-shared --enable-sharedlibs=gcc \
    --enable-error-checking=runtime --enable-error-messages=all \
    --enable-timer-type=clock_gettime \
    --with-pm=hydra:gforker:mpd --with-python=python2 \
    --disable-rpath \
    --enable-fc  --enable-f77 --enable-cxx
  make
}

package() {
  #cd ${srcdir}/mpich2-${pkgver}/build
  cd ${srcdir}/mpich2-${pkgver}
  make DESTDIR=${pkgdir} install

  ln -sf mpiexec.hydra "${pkgdir}/opt/$pkgname/bin/mpiexec"
  ln -sf mpiexec "${pkgdir}/opt/$pkgname/bin/mpirun"
  for pm in hydra mpd gforker; do
    ln -sf "mpiexec.${pm}" "${pkgdir}/opt/$pkgname/bin/mpirun.${pm}"
  done
  install -D -m644 ${srcdir}/mpich2-${pkgver}/COPYRIGHT ${pkgdir}/usr/share/licenses/$pkgname/license.txt
  install -D -m755 ${srcdir}/mpich2-gcc44.bash ${pkgdir}/opt/$pkgname/bin/mpich2-gcc44.bash
}
