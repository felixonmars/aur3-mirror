# Contributor: Yngve Inntjore Levinsen <yngve.inntjore.levinsen@cern.ch>


pkgname=accelerator-ml-uap
pkgver=376
pkgrel=1
pkgdesc="Accelerator Markup Language: Universal Accelerator Parser"

_svntrunk=https://accelerator-ml.svn.sourceforge.net/svnroot/accelerator-ml/uap/trunk

makedepends=('doxygen')
optdepends=()
arch=('x86_64' 'i686')
license=('LGPL3')
url="http://www.lns.cornell.edu/~dcs/aml/"

depends=('cernlib' 'geant4' 'g95')

# source=(fixes.diff) #fixed in trunk?
# md5sums=('7727edc2bf5b4a638a563d86479c8974')
       
build() {
  #!/bin/sh -e
  svn co -r $pkgver $_svntrunk
  cd ${srcdir}/trunk/
  pwd

  #need to do some manual fixes (fixed upstream)
#   patch -p0 -i ../fixes.diff --forward
  #it is also possible to use gfortran to compile the fortran part, in which case you can change the depends array...
  #export UAP_FORTRAN_COMPILER=GFORTRAN
  export UAP_FORTRAN_COMPILER=G95
  g4make
  
  #create documentation:
  doxygen doc/Doxyfile.cfg

  #install supporting documentation
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
  cp -r doc ${pkgdir}/usr/share/doc/${pkgname}/
  cp -r test_files ${pkgdir}/usr/share/doc/${pkgname}/
  cp -r README ${pkgdir}/usr/share/doc/${pkgname}/
  #delete all svn folders...
  rm -rf ${pkgdir}/usr/share/doc/${pkgname}/.svn/
  rm -rf ${pkgdir}/usr/share/doc/${pkgname}/*/.svn/
  rm -rf ${pkgdir}/usr/share/doc/${pkgname}/*/*/.svn/
  
  #install main files
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/lib/
  install -D -m111 bin/* ${pkgdir}/usr/bin/
  install -D -m755 lib/* ${pkgdir}/usr/lib/
  
  #unapply patches:
#   patch -p0 -i ../fixes.diff -R --forward
  }
 
