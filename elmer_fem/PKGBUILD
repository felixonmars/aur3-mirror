# Contributor: Christoph Siegenthaler < csi@gmx.ch >
# Contributor: Thomas Dziedzic

pkgname=elmer_fem
pkgver=5.4.0
pkgrel=1
pkgdesc='Elmer is a simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver.'
url='http://www.csc.fi/elmer/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('elmer_eio' 'elmer_hutiter' 'elmergrid' 'elmer_meshgen2d' 'elmer_umfpack')
makedepends=('gcc-fortran')
source=("ftp://ftp.funet.fi/pub/sci/physics/elmer/src/fem-$pkgver.tar.gz"
        'elmersolver'
	'elmerf90'
        'gebhardtfactors'
        'sc2elmer'
        'viewfactors')
md5sums=('c0758ffbe05ed6d001a8dbbeb3868b78'
         'ee100d7a9426844c7595aac8f7bfaf66'
         '500d79a546eb92a770a76a6d3c342082'
         '59649616be270ea1ce43ee1784b72c8f'
         'a1b828f4d4fcc1c395f699b3ce8c38e6'
         '83c86e32d49c1ada762ed872b92956bf')

build() {
  mkdir -p "$pkgdir/opt/elmer/"{bin,lib}
  mkdir -p "$pkgdir/opt/elmer/share/elmersolver/"{lib,include}
  mkdir -p "$pkgdir/usr/bin"

  cd fem-$pkgver

  export F77=gfortran
  export FC=gfortran
  export BINDIR="$pkgdir/opt/elmer/bin"

  #########################################
  # Makefile doesn't respect DESTDIR, arg!!
  sed -i "s#mkdir -p \$(ELMER_SOLVER_DATADIR)/lib##" $startdir/src/fem-${pkgver}/src/Makefile.in
  sed -i "s#mkdir -p \$(ELMER_SOLVER_DATADIR)/include##" $startdir/src/fem-${pkgver}/src/Makefile.in
  sed -i "s#\$(MKDIR) \$(prefix)/bin##" $startdir/src/fem-${pkgver}/src/Makefile.in
  sed -i "s#mkdir -p \$(ELMER_SOLVER_DATADIR)/include##" $startdir/src/fem-${pkgver}/src/Makefile.in

  sed -i "s#Installing stuff to \${prefix}/bin#Installing stuff to ${startdir}/pkg/opt/elmer/bin#" $startdir/src/fem-${pkgver}/src/Makefile.in
  sed -i "s#\$(CP) ElmerSolver\$(EXEEXT) \$(prefix)/bin#\$(CP) ElmerSolver\$(EXEEXT) $startdir/pkg/opt/elmer/bin#" $startdir/src/fem-${pkgver}/src/Makefile.in
  sed -i "s#\$(CP) ViewFactors\$(EXEEXT) \$(prefix)/bin#\$(CP) ViewFactors\$(EXEEXT) $startdir/pkg/opt/elmer/bin#" $startdir/src/fem-${pkgver}/src/Makefile.in
  sed -i "s#\$(CP) GebhardtFactors\$(EXEEXT) \$(prefix)/bin#\$(CP) GebhardtFactors\$(EXEEXT) $startdir/pkg/opt/elmer/bin#" $startdir/src/fem-${pkgver}/src/Makefile.in
  sed -i "s#\$(CP) libelmersolver\$(SHL_EXT) \$(prefix)/lib#\$(CP) libelmersolver\$(SHL_EXT) $startdir/pkg/opt/elmer/lib#" $startdir/src/fem-${pkgver}/src/Makefile.in
  sed -i "s#\$(CP) elmerf90 \$(prefix)/bin#\$(CP) elmerf90 $startdir/pkg/opt/elmer/bin#" $startdir/src/fem-${pkgver}/src/Makefile.in

  sed -i "s#\$(CP) \*\$(SHL_EXT) \$(ELMER_SOLVER_DATADIR)/lib#\$(CP) \*\$(SHL_EXT) $startdir/pkg/opt/elmer/share/elmersolver/lib#" $startdir/src/fem-${pkgver}/src/Makefile.in
  sed -i "s#\$(CP) elements.def \$(ELMER_SOLVER_DATADIR)/lib#\$(CP) elements.def $startdir/pkg/opt/elmer/share/elmersolver/lib#" $startdir/src/fem-${pkgver}/src/Makefile.in
  sed -i "s#\$(CP) SOLVER.KEYWORDS \$(ELMER_SOLVER_DATADIR)/lib#\$(CP) SOLVER.KEYWORDS $startdir/pkg/opt/elmer/share/elmersolver/lib#" $startdir/src/fem-${pkgver}/src/Makefile.in
  sed -i "s#\$(CP) \*.mod \$(ELMER_SOLVER_DATADIR)/include#\$(CP) \*.mod $startdir/pkg/opt/elmer/share/elmersolver/include#" $startdir/src/fem-${pkgver}/src/Makefile.in

  sed -i "s#ELMER_SOLVER_DATADIR = \$(prefix)/share/elmersolver#ELMER_SOLVER_DATADIR = $pkgdir/\$(prefix)/share/elmersolver#" $srcdir/fem-$pkgver/src/binio/Makefile.in

  sed -i "s#elmerf90 elmerf90-nosh elmerld \$(prefix)/bin#elmerf90 elmerf90-nosh elmerld ${startdir}/pkg/\$(prefix)/bin#" $startdir/src/fem-${pkgver}/src/Makefile.in
  #########################################

  ./configure --prefix=/opt/elmer || return 1

  make || return 1

  make DESTDIR="$pkgdir" install || return 1
  install "$srcdir/elmersolver" "$pkgdir/usr/bin"
  install "$srcdir/gebhardtfactors" "$pkgdir/usr/bin"
  install "$srcdir/sc2elmer" "$pkgdir/usr/bin"
  install "$srcdir/viewfactors" "$pkgdir/usr/bin"
  install "$srcdir/elmerf90" "$pkgdir/usr/bin"
}
