# Maintainer: Holger Nahrstaedt

pkgname=comedi-cvs
pkgver=20081213
pkgrel=1
pkgdesc="Comedi is a collection of drivers for a variety of common data acquisition plug-in boards. The drivers are implemented as a core Linux kernel module providing common functionality and individual low-level driver modules."
arch=('i686' 'x86_64')
url="http://www.comedi.org/"
license=('GPL2')
provides=('comedi')
conflicts=('comedi')
makedepends=('cvs' 'gcc')
_cvsroot=":pserver:anonymous@cvs.comedi.org:/cvs/comedi"
_cvsmod="comedi"
source=()
md5sums=()

build() {
    cd ${srcdir} 
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
    sh autogen.sh
    ./configure --prefix=${pkgdir}/  --with-modulesdir=${pkgdir}/lib/modules/
    make all || return 1
    make INSTALL_ROOT=${pkgdir}/ install || return 1
    rm -r ${pkgdir}/lib/modules/comedi
}
