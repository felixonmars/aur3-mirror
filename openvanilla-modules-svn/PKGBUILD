# Maintainer: AndyWxy <andy.bio@gmail.com>

pkgname=openvanilla-modules-svn
pkgver=316
pkgrel=1
pkgdesc="Openvanilla modules for ucimf."
arch=("i686")
license=('GPL')
url="http://code.google.com/p/ucimf/"
depends=()
makedepends=('subversion')
source=()
md5sums=()

_svnmod="openvanilla"
_svntrunk="http://ucimf.googlecode.com/svn/openvanilla"

build() {

    cd $startdir/src/
    msg "Getting svn sources..."
    svn co $_svntrunk $_svnmod -r $pkgver
    [ -d $_svnmod-build ] && rm -r $_svnmod-build
    cp $_svnmod $_svnmod-build -r || return 1
    cd $_svnmod-build || return 1

    msg "Starting build..."
    ./init.sh
    cd openvanilla-modules
    ./configure --prefix=/usr 
    make || return 1
    make DESTDIR=$pkgdir install
    
    rm -rf $srcdir/$_svnmod-build
}

