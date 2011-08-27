# Maintainer: Holger Nahrstaedt

pkgname=comedilib-cvs
pkgver=20081213
pkgrel=1
pkgdesc="Comedilib is a user-space library that provides a developer-friendly interface to Comedi devices. Included in the Comedilib distribution is documentation, configuration and calibration utilities, and demonstration programs. "
arch=('i686' 'x86_64')
url="http://www.comedi.org/"
license=('LGPL')
depends=('bash')
provides=('comedilib')
conflicts=('comedilib')
makedepends=('cvs' 'gcc')
_cvsroot=":pserver:anonymous@cvs.comedi.org:/cvs/comedi"
_cvsmod="comedilib"
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
    ./configure  --prefix=/usr
    make all || return 1
    make prefix=${pkgdir}/usr install
}
