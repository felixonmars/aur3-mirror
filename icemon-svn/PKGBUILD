#Contributor: Anselmo L. S. Melo <anselmolsm @ gmail.com>

pkgname=icemon-svn
pkgver=1239983
pkgrel=3
pkgdesc=""
url="http://en.opensuse.org/Icecream"
license="GPL"
depends=('gcc')
arch=('i686' 'x86_64')
source=()
md5sums=()
makedepends=('subversion' 'cmake' 'automoc4' 'icecream1')
provides=('icemon')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/devtools/icemon
_svnmod=icemon

build() {
    msg "Starting SVN checkout..."
    cd ${srcdir}
    if [ -d $_svnmod/.svn ]; then
        msg "Updating icemon SVN..."
        svn up ${_svnmod}
    else
        msg "Checking out icemon SVN..."
        svn co ${_svntrunk}
    fi
    msg "SVN checkout done or server timeout."

    msg "Starting make..."

    if [ -d ${_svnmod}/build/ ]; then
        msg "Build exists, cleaning it up... "
        rm -rf ${_svnmod}/build || return 1
    fi

    msg "Creating build directory... "

    mkdir ${_svnmod}/build
    mkdir -p $pkgdir/{opt/icemon/bin,usr/bin}
    cd ${_svnmod}/build
    export PKG_CONFIG_PATH=/opt/icecream/lib/pkgconfig/:$PKG_CONFIG_PATH
    cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/opt/icemon .. || return 1
    make || return 1
    make install || return 1
    ln -s /opt/icemon/bin/icemon $pkgdir/usr/bin/icemon
}
