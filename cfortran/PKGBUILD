##Contributor: T.Cunly

pkgname=cfortran
pkgver=4.4_14
pkgrel=1
pkgdesc="Header file allowing to call Fortran routines from C and C++ " 
license=(GPL)
arch=('any')
url="http://www-zeus.desy.de/~burow/cfortran/"
install="cfortran.install"
md5sums=('d6a335899e838231bad3f222cff184c7'
         '9ca5979dafaf3886355f0b13245c08e7')

NETADDRESS=http://ftp.heanet.ie/debian/pool/main/c/cfortran/
ORIGINFILE=cfortran_4.4.orig.tar.gz
PATCHFILE=cfortran_4.4-14.diff.gz

source=("${NETADDRESS}/${ORIGINFILE}" "${NETADDRESS}/${PATCHFILE}") 


build() {
    cd $srcdir
    patch -p0 <cfortran_4.4-14.diff
    
    INCLUDEDIR=$pkgdir/usr/include/cfortran
    DOCDIR=$pkgdir/usr/share/doc/cfortran
    EXAMPLEDIR=$DOCDIR/examples
    
    [  -d $INCLUDEDIR ] || mkdir -p $INCLUDEDIR
    [  -d $EXAMPLEDIR  ] || mkdir -p $EXAMPLEDIR
    [  -d $DOCDIR ]  || mkdir -p $DOCDIR
        
    cd $srcdir/cfortran-4.4
    cp cfortran.h $INCLUDEDIR/
       
    cp cfortran.doc cfortran.html index.htm cfortest.c cfortex.f $DOCDIR/

    tar xfz cfortran.examples.tar.gz
    cp -r eg/* $EXAMPLEDIR/

    # fix example symlinks
    cd $EXAMPLEDIR/sz1 && ln -sf sz1.c sz1.C
    cd $EXAMPLEDIR/pz && ln -sf pz.c pz.C
}
 
