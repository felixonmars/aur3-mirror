# Maintainer: AndyWxy <andy.bio@gmail.com>

pkgname=fbterm-ucimf-svn
pkgver=310
pkgrel=1
pkgdesc="ucimf ime server for fbterm"
arch=("i686")
license=('GPL')
url="http://code.google.com/p/ucimf"
depends=('libucimf-svn','openvanilla-modules-svn','ucimf-openvanilla-svn')
makedepends=('subversion')
source=()
md5sums=()

_svnmod="fbterm_ucimf"
_svntrunk="http://ucimf.googlecode.com/svn/console/fbterm_ucimf"

build() {

    cd $startdir/src/
    msg "Getting svn sources..."
    svn co $_svntrunk $_svnmod -r $pkgver
    [ -d $_svnmod-build ] && rm -r $_svnmod-build
    cp $_svnmod $_svnmod-build -r || return 1
    cd $_svnmod-build || return 1

    msg "Starting build..."
    ./autogen.sh
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$pkgdir install
    
    rm -rf $srcdir/$_svnmod-build
}

