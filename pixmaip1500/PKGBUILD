# Contributor: Roman Abreu <romanlx at gmail.com>
pkgname=pixmaip1500
_casepkgname=iP1500Linux
pkgver=2.5
pkgrel=2
pkgdesc="Printer driver for Canon Pixma ip1500"
arch=('i686')
url="http://www.canon.com/"
license=('custom')
depends=('rpmextract' 'hplip' 'foomatic' 'ghostscript')
source=(http://software.canon-europe.com/files/soft22415/software/${_casepkgname}.tar.gz)
md5sums=('a77599e93a334107eb003e656ff6893b')
build() {
    cd $startdir/src/iP1500
    rpmextract.sh bjfilter-common-2.50-2.src.rpm
    tar xvf bjfilter-common-2.50-2.tar.gz
    cd bjfilter-common-2.50
    mkdir -p $startdir/pkg/usr/share/cups/model
    cp ppd/canonpixmaip1500.ppd $startdir/pkg/usr/share/cups/model
    mkdir -p $startdir/pkg/usr/lib/bjlib
    cp 214/database/* $startdir/pkg/usr/lib/bjlib
    cp -a 214/libs_bin/* $startdir/pkg/usr/lib

    cd libs
    ./autogen.sh --prefix=$startdir/pkg/usr/local
    make
    make install
    cd ..

    cd bjfilter
    ./autogen.sh --prefix=$startdir/pkg/usr/local --program-suffix=pixmaip1500
    make
    make install
    cd ..

    cd pstocanonbj
    mkdir -p $startdir/pkg/usr/lib/cups/filter/
    ./autogen.sh --prefix=$startdir/pkg/usr/local
    make
    make install
    cd ..
    cp $startdir/src/iP1500/bjfilter-common-2.50/pstocanonbj/filter/pstocanonbj $startdir/pkg/usr/lib/cups/filter/

}
