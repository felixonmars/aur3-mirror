# Maintainer: Yngve Inntjore Levinsen <yngve.inntjore.levinsen@cern.ch>


pkgname=bdsim
pkgver=618
pkgrel=1
pkgdesc="A Geant4 extension toolkit for beamline simulations."

_G4aurver=4_9_3_p02_1

makedepends=('svn')
optdepends=('root: optional output format' 'accelerator-ml-uap: simplifies parsing from other sequence formats (e.g. MadX)')
arch=('x86_64' 'i686')
license=('none')
url="http://www.pp.rhul.ac.uk/twiki/bin/view/JAI/BdSim"

depends=("geant4==${_G4aurver}" 'cernlib' 'awk')

source=(archconfig.sh fix.patch )

md5sums=('0b52741ab08da1f44f0ac8f493d23b52'
         '12e9bdef1ed34ac8ed2fdb2955ea4567')

_svntrunk=https://svn.pp.rhul.ac.uk/JAI/BDSIM/trunk
_svnmod=bdsim

build() {
  #!/bin/sh -e
  svn co -r $pkgver $_svntrunk bdsim
  cd ${srcdir}
  if [ -d build ]
  then
    rm -rf build
  fi
  cp -r bdsim build
  cd build

    #need to do some manual fixes (is reported upstream)
    patch -u -p1 -i ../fix.patch
    patch -u -p1 -i ../Makefile.diff
  g4run .././archconfig.sh
  g4make
  
  msg "BDSIM finished compiling, now packaging"
  

  #install supporting documentation
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
  cp -r docs ${pkgdir}/usr/share/doc/${pkgname}/
  cp -r examples ${pkgdir}/usr/share/doc/${pkgname}/
  cp -r utils ${pkgdir}/usr/share/doc/${pkgname}/
  cp vis.mac ${pkgdir}/usr/share/doc/${pkgname}/
  #delete all svn folders...
  rm -rf ${pkgdir}/usr/share/doc/${pkgname}/.svn/
  rm -rf ${pkgdir}/usr/share/doc/${pkgname}/*/.svn/
  rm -rf ${pkgdir}/usr/share/doc/${pkgname}/*/*/.svn/
  rm -rf ${pkgdir}/usr/share/doc/${pkgname}/*/*/*/.svn/
  rm -rf ${pkgdir}/usr/share/doc/${pkgname}/*/*/*/*/.svn/
  
  #install main files
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/lib/
  install -D -m111 bin/Linux-g++/bdsim ${pkgdir}/usr/bin/
  install -D -m755 parser/libgmad.so ${pkgdir}/usr/lib/

# Remove compilation directories: 
  rm -rf bin
  rm -rf tmp
  
  
  #unapply patches:
#    git apply ../bdsimCC.diff -R
#    git apply ../ggmad.diff -R
#    git apply ../gmad.diff -R
#    git apply ../Makefile.diff -R
#    git apply ../physicslist.diff -R
  }
 
