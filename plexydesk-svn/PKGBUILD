#Contributor: Lukas Appelhans <l.appelhans@gmx.de>
pkgname=plexydesk-svn
pkgver=256
pkgrel=1
pkgdesc="A Modular Desktop Renderer"
url="http://plexydesk.org"
license="LGPL3"
arch=('i686' 'amd64')
depends=('qt-copy-svn')
makedepends=('subversion' 'cmake')
provides=('plexydesk')
conflicts=('plexydesk')
source=()
md5sums=()

_svnmod="plexydesk-read-only"
_svntrunk="http://plexydesk.googlecode.com/svn/trunk/"

build() {
    cd $startdir/src
    #mkdir -p ~/.subversion; touch ~/.subversion/servers
    msg "Connecting to the SVN server...."
    svn co $_svntrunk $_svnmod

    [ -d ./$_svnmod-build ] && rm -fr ./$_svnmod-build
    cp -r ./$_svnmod ./$_svnmod-build
    cd ./$_svnmod-build

    msg "SVN checkout done or server timeout"
    msg "Starting cmake..."
    export FFMPEG_DIR=$startdir/src/$_svnmod/cmakemodules

    cmake -DCMAKE_INSTALL_PREFIX=$startdir/pkg/ . || return 1

    msg "Starting make..."

    make || return 1
    make install
}
 
