pkgname=3dslicer-svn
pkgver=15809
pkgrel=2
url="http://www.slicer.org/"
pkgdesc="A Multi-Platform, free and open source software package for visualization and medical image computing"
license=('custom:License.txt')
arch=('i686' 'x86_64')
[ $CARCH = 'x86_64' ] && _arch='amd64'
[ $CARCH = 'i686' ]   && _arch='i386'

source=()

depends=('qt>=4.6')
makedepends=('cmake' 'subversion' 'cvs')
md5sums=()
_svntrunk=http://svn.slicer.org/Slicer4/trunk
_svnmod=trunk

provides=('3DSlicer')
conflicts=('3DSlicer')

build() {
    svn co $_svntrunk $_svnmod
    msg "SVN checkout done or server timeout"
    msg "Starting make..."
    
    BUILDDIR=${srcdir}/$_svnmod/build
    mkdir -p $BUILDDIR
    cd $BUILDDIR

    cmake ${srcdir}/$_svnmod/ -DBUILD_DOCUMENTATION=OFF -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=Release -DSlicer_USE_PYTHONQT=OFF -DCMAKE_INSTALL_PREFIX=/opt/

    PROCS=`cat /proc/cpuinfo | grep processor | wc -l`
    make -j
return 0
}
