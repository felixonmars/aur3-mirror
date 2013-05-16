# Maintainer: Louis-Guillaume Gagnon <louis.guillaume.gagnon@gmail.com>
pkgname=mafalda-svn
pkgver=82
pkgrel=1
pkgdesc="Medipix pixel detector data analysis framework"
arch=('any')
url="https://twiki.cern.ch/bin/view/Main/MAFalda"
license=('GPL')
depends=('svn' 'root')
install='mafalda.install'
source=("svn+http://svn.cern.ch/guest/mafalda")

pkgver() { 
   cd $srcdir/mafalda 
    svnversion | tr -d [A-z]    
}

prepare() {
    msg "Applying Makefile patches"  
    cd $srcdir/mafalda/mafalda_framework
    patch < $SRCDEST/mafalda_framework-Makefile.patch 
    cd $srcdir/mafalda/mpxdataconverter
    patch < $SRCDEST/mpxdataconverter-Makefile.patch
}

build() {
	cd "$srcdir/mafalda/mafalda_framework"
	make
    cd "$srcdir/mafalda/mpxdataconverter"
    make
}

package() {
    _optdir="$pkgdir/opt/mafalda"
    _builddir="mafalda/mafalda_framework"
    mkdir -p "$_optdir"
    mkdir "$_optdir/testdata"
    find mafalda/ -name "*.C"    -exec cp '{}' $_optdir \; 
    find mafalda/ -name "*.sh"   -exec cp '{}' $_optdir \;
    find mafalda/ -name "*.in"   -exec cp '{}' $_optdir \;
    find mafalda/ -name "*.py"    -exec cp '{}' $_optdir \; 
    find mafalda/ -name "*.so"    -exec cp '{}' $_optdir \;   
    cp mafalda/mafalda_framework/testdata/* $_optdir/testdata 
    mkdir -p $pkgdir/usr/share/root/macros/styles 
    mv $_optdir/MedipixStyle.C $pkgdir/usr/share/root/macros/styles 
    cp $SRCDEST/newalgo.sh $_optdir
    mkdir -p $pkgdir/usr/bin/
    cp mafalda/mpxdataconverter/raw_to_pixeldm /$pkgdir/usr/bin/
    cp mafalda/mpxdataconverter/mpxdataconverter /$pkgdir/usr/bin/
}
md5sums=('SKIP')
