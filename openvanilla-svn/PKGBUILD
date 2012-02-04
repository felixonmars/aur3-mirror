# Maintainer: AndyWxy <andy.bio@gmail.com>

pkgname=openvanilla-svn
pkgver=239
pkgrel=1
pkgdesc="Openvanilla modules for ucimf."
arch=("i686")
license=('GPL')
url="http://www.sourceforge.net/projects/ucimf"
depends=()
makedepends=('subversion')
source=()
md5sums=()

_svnmod="openvanilla"
_svntrunk="https://ucimf.svn.sourceforge.net/svnroot/ucimf/openvanilla"

build() {

    cd $startdir/src/
    msg "Getting svn sources..."
    svn co $_svntrunk $_svnmod -r $pkgver
    [ -d $_svnmod-build ] && rm -r $_svnmod-build
    cp $_svnmod $_svnmod-build -r || return 1
    cd $_svnmod-build || return 1

    msg "Starting build..."

    ./init.sh
    cd Modules
    make || return 1
    make install INSTALL_PREFIX=$pkgdir/usr
    
    rm -rf $srcdir/$_svnmod-build
}

