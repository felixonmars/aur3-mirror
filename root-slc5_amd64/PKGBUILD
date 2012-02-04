# Contributor: T.Cunly

pkgname=root-slc5_amd64
pkgver=5.23.04
pkgrel=1
pkgdesc="An object oriented framework for large scale data analysis. ROOT is a C++ replacement of the popular PAW program developed at CERN."
arch=('x86_64')
url="http://root.cern.ch"
license=('GPL')

install=root.install
depend=

source=(ftp://root.cern.ch/root/root_v$pkgver.Linux-slc5_amd64-gcc4.3.tar.gz) 

build () {
    INSTALLDIR=/opt/Science
    [ -d $pkgdir$INSTALLDIR ]  || mkdir -p $pkgdir$INSTALLDIR
    
    MANDIR=/usr/local
    [ -d $pkgdir$MANDIR ] || mkdir -p $pkgdir$MANDIR
    cd $srcdir
    cp -r root/man $pkgdir$MANDIR
    
    mv root $pkgdir$INSTALLDIR/ROOT
}
   