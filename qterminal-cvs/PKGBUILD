# Contributor: Odites <odites@gmail.ocm>

pkgname=qterminal-cvs
pkgver=20090626
pkgrel=1
pkgdesc="Light QT-based multitab terminal emulator. Based on QTermWidget"
arch=('i686' 'x86_64')
url="http://www.qt-apps.org/content/show.php/QTerminal?content=92158"
license=('GPL')
depends=('qt')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@qterminal.cvs.sourceforge.net:/cvsroot/qterminal"
_cvsmod="qterminal"
source=()
md5sums=()

build() {
    cd ${srcdir} 
    msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
    if [ -d ${_cvsmod}/CVS ]; then
      cd ${_cvsmod}
      cvs -z3 update -d
    else
      cvs -z3 -d ${_cvsroot} co -D ${pkgver} -f ${_cvsmod}
      cd ${_cvsmod}
    fi
    
    msg "CVS checkout done or server timeout"
    msg "Starting make..."
 
    cp -r ../${_cvsmod} ../${_cvsmod}-build
    cd ../${_cvsmod}-build
    
    sh ./get_qtermwidget.sh

    cd ../${_cvsmod}-build

    sh ./build.sh
    
    make DESTDIR=${pkgdir}/ install

    install -D -m755 ${_cvsmod} ${pkgdir}/usr/bin/${_cvsmod}
}