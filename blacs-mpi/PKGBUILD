# Maintainer: Michele Mocciola <mickele>
pkgname=blacs-mpi
pkgver=1.1
pkgrel=4
pkgdesc="BLACS (Basic Linear Algebra Communication Subprograms) project is a linear algebra oriented message passing interface."
url="http://www.netlib.org/blacs/"
license='custom'
depends=('glibc' 'mpich')
makedepends=('gcc' 'coreutils' 'sed' 'binutils')
provides=()
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
install=${pkgname}.install
source=(http://www.netlib.org/blacs/mpiblacs.tgz  http://www.netlib.org/blacs/blacstester.tgz http://www.netlib.org/blacs/mpiblacs-patch03.tgz LICENSE)
md5sums=('28ae5b91b3193402fe1ae8d06adcf500'
         '5cdd9cf792b793baaeb8acef17b9bb71'
         '48fdf5e4ef6cf53daec9eeef40498a8b'
         '182bf79471c020e8274fec5ef1240005')

_blacsdbglvl=0

build() {
  cd $startdir/src/BLACS || return 1

  #      -e "s|SENDIS =|SENDIS = -DSndIsLocBlk|g" \
  # Copy and modify a file containing variables necessary to compile the package
  cp $startdir/src/BLACS/BMAKES/Bmake.MPI-LINUX ./Bmake.inc
  sed -e "s|\$(HOME)/BLACS|$startdir/src/BLACS|g" \
      -e "s|BLACSDBGLVL = 0|BLACSDBGLVL = ${_blacsdbglvl}|" \
      -e "s|BLACSFINIT  = \$(BLACSdir)/blacsF77init_\$(COMMLIB)-\$(PLAT)-\$(BLACSDBGLVL)\.a|BLACSFINIT  = \$(BLACSdir)/libblacsf77\.a|" \
      -e "s|BLACSCINIT  = \$(BLACSdir)/blacsCinit_\$(COMMLIB)-\$(PLAT)-\$(BLACSDBGLVL).a|BLACSCINIT  = \$(BLACSdir)/libblacsc.a|" \
      -e "s|BLACSLIB    = \$(BLACSdir)/blacs_\$(COMMLIB)-\$(PLAT)-\$(BLACSDBGLVL).a|BLACSLIB    = \$(BLACSdir)/libblacs.a|" \
      -e "s|MPILIB = \$(MPILIBdir)/libmpich.a|MPILIB = -Wl,-rpath,\$(MPILIBdir) -L\$(MPILIBdir) -lmpich -lmpl -lssl -luuid -lpthread -lrt -ldl -lnsl -lrt|g" \
      -e "s|BTLIBS = \$(BLACSFINIT) \$(BLACSLIB) \$(BLACSFINIT) \$(MPILIB)|BTLIBS = -L\$(BTOPdir)/LIB -lblacsf77 -lblacs -lblacsf77 \$(MPILIB)|" \
      -e "s|/usr/local/mpich|/opt/mpich|g" \
      -e "s|INTFACE = -Df77IsF2C|INTFACE = -DAdd_|g" \
      -e "s|TRANSCOMM = -DCSameF77|TRANSCOMM =|g" \
      -e "s|WHATMPI =|WHATMPI =|g" \
      -e "s|g77|gfortran|g" \
      -e "s|F77FLAGS       = \$(F77NO_OPTFLAGS) -O|F77FLAGS       = \$(F77NO_OPTFLAGS) $CFLAGS -fpic|g" \
      -e "s|F77LOADFLAGS   = |F77LOADFLAGS   = -lpthread|g" \
      -e "s|CCFLAGS        = -O4|CCFLAGS        = $CFLAGS -fpic|g" \
      -e "s|CCLOADFLAGS    = |CCLOADFLAGS    = -lpthread|g" \
      -i Bmake.inc

  # -e "s|TRANSCOMM = -DCSameF77|TRANSCOMM = -DUseMpi2|g" \
  # Compile the package
  make mpi || return 1
  export GFORTRAN_UNBUFFERED_ALL=y
  make tester || return 1
  unset GFORTRAN_UNBUFFERED_ALL

  # Creates shared libraries and install all libraries
  cd $startdir/src/BLACS/LIB || return 1
  for _FILE in `ls *.a | sed "s|\.a||"`; do
      ld -Bshareable -o ${_FILE}.so.${pkgver} -x -soname ${_FILE}.so --whole-archive ${_FILE}.a || return 1
      install -m 644 -D ${_FILE}.a $startdir/pkg/usr/lib/${_FILE}.a || return 1
      install -m 755 ${_FILE}.so.${pkgver} $startdir/pkg/usr/lib || return 1
      ln -sf ${_FILE}.so.${pkgver} $startdir/pkg/usr/lib/${_FILE}.so.${pkgver:0:1} || return 1
  done

  # Install test
  mkdir -p $startdir/pkg/usr/share/$pkgname/testing || return 1
  cd $startdir/src/BLACS/TESTING/EXE || return 1
  install -m755 -D xCbtest_MPI-LINUX-${_blacsdbglvl} $startdir/pkg/usr/share/$pkgname/testing/xCbtest_MPI-LINUX || return 1
  install -m755 xFbtest_MPI-LINUX-${_blacsdbglvl} $startdir/pkg/usr/share/$pkgname/testing/xFbtest_MPI-LINUX || return 1
  install -m644 *.dat $startdir/pkg/usr/share/$pkgname/testing/ || return 1

  # Install license
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname || return 1
  install -m644 $startdir/src/LICENSE $startdir/pkg/usr/share/licenses/$pkgname || return 1
}
