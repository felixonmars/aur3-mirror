# Contributor: Dominik Pieper <nachtwandler@chakra-project.org>

pkgname=kboincspy-kde4-svn
pkgver=1261
pkgrel=1
pkgdesc="Monitor and control utility for the BOINC client"
url="http://kboincspy.sourceforge.net"
license=('GPL')
depends=('kdebase' 'boinc')
conflicts=('kboincspy')
replaces=('kboincspy')
provides=('kboincspy')
makedepends=('subversion' 'cmake' 'gcc')
source=()
md5sums=()
arch=('i686')

_svntrunk=https://kboincspy.svn.sourceforge.net/svnroot/kboincspy/branches/KDE4/kboincspy
_svnmod=kboincspy

build() {
    cd $startdir/src/
    svn co $_svntrunk $_svnmod
    cd kboincspy
    install_prefix=`kde4-config --prefix`

    echo "cmake -DCMAKE_INSTALL_PREFIX=\"${install_prefix}\" \\"
    echo "  -DCMAKE_BUILD_TYPE=debugfull ."

    cmake -DCMAKE_INSTALL_PREFIX="${install_prefix}" \
    -DCMAKE_BUILD_TYPE=debugfull .

    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
}
