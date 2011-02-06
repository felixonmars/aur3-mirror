# Maintainer: AndyWxy <andy.bio@gmail.com>

pkgname=ucimf-openvanilla-svn
pkgver=316
pkgrel=1
pkgdesc="Bridge between ucimf suites and openvanilla input modules."
arch=("i686")
license=('GPL')
url="http://code.google.com/p/ucimf"
depends=('freetype2' 'libucimf-svn')
makedepends=('subversion')
source=()
md5sums=()

_svnmod="ucimf-openvanilla"
_svntrunk="http://ucimf.googlecode.com/svn/ucimf-openvanilla"

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

