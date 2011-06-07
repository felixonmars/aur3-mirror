# Maintainer: Yngve Inntjore Levinsen <yngve.inntjore.levinsen@cern.ch>


pkgname=accelerator-ml-uap
pkgver=377
pkgrel=2
_antlrver=2.7.0
pkgdesc="Accelerator Markup Language: Universal Accelerator Parser"

_svntrunk=https://accelerator-ml.svn.sourceforge.net/svnroot/accelerator-ml/uap/trunk
_svnmod=amluap

makedepends=('doxygen' 'g95')
#optdepends=()
# statically linked at the moment..
depends=("xerces-c-2") 

#conflicts=('antlr')
#provides=("antlr=${_antlrver}")
arch=('x86_64' 'i686')
license=('LGPL3')
url="http://www.lns.cornell.edu/~dcs/aml/"

source=("notbuildantlr.patch")
md5sums=('6cd2f01e4801de18aee8e9b6856ddac9')
       
build() {
  #!/bin/sh -e
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    if [ -d "$srcdir/$_svnmod-build" ]; then
     rm -rf "$srcdir/$_svnmod-build"
    fi
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    cd "$srcdir/$_svnmod-build"
    
    # patching:
    # AML not compatible with arch linux antlr version at the moment..
    #patch -p0 -u -i ../notbuildantlr.patch

    export UAP_FORTRAN_COMPILER=G95
    #make noantlr
    make
    
    #create documentation:
    doxygen doc/Doxyfile.cfg

}
package() {
    cd "$srcdir/$_svnmod-build"

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
    install -D -m755 bin/* ${pkgdir}/usr/bin/
    install -D -m644 lib/* ${pkgdir}/usr/lib/
  
    # Remove ANTLR library (conflict with other package)
    rm -f ${pkgdir}/usr/lib/libantlr*
}
 
