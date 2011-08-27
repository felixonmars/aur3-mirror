###参照gentoo的相应ebuild文件
#Contributor : T.Cunly
pkgname=pythia8
pkgver=130
pkgrel=1
pkgdesc="Lund Monte Carlo high-energy physics event generator" 
arch=('i686' 'x86_64')
url="http://home.thep.lu.se/~torbjorn/Pythia.html"
license=('GPL')
depends=(HepMC)
install=(pythia8.install)
source=("http://home.thep.lu.se/~torbjorn/pythia8/${pkgname}${pkgver}.tgz")
md5sums=("96af2f9e52baee749647b005851b356f")

build() {
    cd "$startdir/src/${pkgname}${pkgver}"
    #Change some directories
    mkdir -p include/pythia8
    mv include/*.h include/pythia8/
    sed -i -e "s:INCDIR=include:INCDIR=include/pythia8:g" Makefile ||return 1
    sed -i -e "s:LIBDIR=lib:LIBDIR=lib/pythia8:g" Makefile || return 1
    sed -i -e "s:LIBDIRARCH=lib/archive:LIBDIRARCH=lib/pythia8/archive:g" Makefile ||return 1
           
    ./configure --with-hepmc=/usr/local --with-hepmcversion=2  --lcgplatform=Linux-gcc4  --enable-shared
    
    #Change the build parameter
    sed -i -e "s:-O2:-O3:g" config.mk || return 1
    
    make -j3 || return 1
    
    INSDIR=/usr/local
    SRCDIR=$startdir/src/${pkgname}${pkgver}
    
    ###安装库和头文件###
    LIBDIR=${startdir}/pkg/${INSDIR}/lib
    INCLUDEDIR=${startdir}/pkg/${INSDIR}/include
    [ -d $INCLUDEDIR  ] || mkdir -p $INCLUDEDIR
    [ -d $LIBDIR ] || mkdir -p $LIBDIR
    cp -r  ${SRCDIR}/lib/*  $LIBDIR/  || die "lib install failed"
    cp -r  ${SRCDIR}/include/*  $INCLUDEDIR/ || die "headers install failed"
    
    ###安装doc###
    DOCDIR=${startdir}/pkg/${INSDIR}/doc/pythia8
    [ -d $DOCDIR ] || mkdir -p $DOCDIR
   
    cp -r ${SRCDIR}/xmldoc $DOCDIR/ || die "xmldoc install failed"
    cp -r ${SRCDIR}/htmldoc $DOCDIR/ || die "htmldoc install failed"
    cp -r ${SRCDIR}/phpdoc $DOCDIR/ || die "phpdoc install failed"
    
    ###安装例子##
    EXAMPLEDIR=${startdir}/pkg/${INSDIR}/examples/pythia8
    [ -d $EXAMPLEDIR  ] || mkdir -p $EXAMPLEDIR/bin
    cp -r ${SRCDIR}/examples/* $EXAMPLEDIR/ || die "examples install failed"
    
    ###Modify the Makefile in the examples directory####
    cd $EXAMPLEDIR
    cp $SRCDIR/config.mk ./config.mk.orig
    sed -i -e "s:-include \.\./config\.mk:-include config\.mk\.orig:" Makefile || return 1
    sed -i -e "s:\.\.:$INSDIR:g" Makefile || return 1
    sed -i -e "s:INCDIR=include:INCDIR=include/pythia8:" Makefile ||return 1
    sed -i -e "s:LIBDIR=lib:LIBDIR=lib/pythia8:" Makefile || return 1
    sed -i -e "s:LIBDIRARCH=lib/archive:LIBDIRARCH=lib/pythia8/archive:" Makefile ||return 1
    sed -i -e "s:-o /usr/local:-o .:" Makefile || return 1
    
     
    ###Modify the mainNN.cc files in the examples directory so as the program can find the xmldoc###
    cd $EXAMPLEDIR
    for i in *.cc
    do
      sed -i -e "s:Pythia pythia\;:Pythia pythia\(\"$INSDIR/doc/pythia8/xmldoc\"\)\;:" $i || echo "Failed"
    done
}
