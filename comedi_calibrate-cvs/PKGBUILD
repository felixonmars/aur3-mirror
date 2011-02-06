# Maintainer: Holger Nahrstaedt

pkgname=comedi_calibrate-cvs
pkgver=20090326
pkgrel=1
pkgdesc="Comedi is a collection of drivers for a variety of common data acquisition plug-in boards. The drivers are implemented as a core Linux kernel module providing common functionality and individual low-level driver modules."
arch=('i686' 'x86_64')
url="http://www.comedi.org/"
license=('GPL2')
provides=('comedi_calibrate')
conflicts=('comedi_calibrate')
makedepends=('cvs' 'gcc' 'boost')
_cvsroot=":pserver:anonymous@cvs.comedi.org:/cvs/comedi"
_cvsmod="comedi_calibrate"
source=()
md5sums=()

build() {
    cd ${srcdir} 
     rm -rf cd ${srcdir}/$_cvsmod-build
    msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
    if [ -d $_cvsmod/CVS ]; then
      cd $_cvsmod
      cvs -z3 update -d
    else
      cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
      cd $_cvsmod
    fi
    #./autogen.sh

    msg "CVS checkout done or server timeout"
    msg "Starting make..."
 
    cp -r ../$_cvsmod ../$_cvsmod-build
    cd ../$_cvsmod-build
    autoreconf -i -B m4
    ./configure --prefix=${pkgdir}/
    make  || return 1
    make   install || return 1
}
