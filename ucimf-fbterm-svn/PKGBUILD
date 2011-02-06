# Maintainer: AndyWxy <andywxy@gmail.com>

pkgname=ucimf-fbterm-svn
pkgver=239
pkgrel=1
pkgdesc="Fbterm with the ucimf patch."
arch=("i686")
license=('GPL')
url="http://www.sourceforge.net/projects/ucimf"
depends=('fontconfig' 'libucimf-svn' 'ucimf-openvanilla-svn' 'openvanilla-svn')
makedepends=('subversion')
conflicts=('fbterm')
replaces=('fbterm')
provides=('fbterm')
install=$pkgname.install
source=()
md5sums=()

_svnmod="console"
_svntrunk="https://ucimf.svn.sourceforge.net/svnroot/ucimf/console"

build() {

    cd $startdir/src/
    msg "Getting svn sources..."
    svn co $_svntrunk $_svnmod -r $pkgver
    [ -d $_svnmod-build ] && rm -r $_svnmod-build
    cp $_svnmod $_svnmod-build -r || return 1
    cd $_svnmod-build/fbterm || return 1

    msg "Starting build..."

    ./init.sh 
    cd fbterm-1.2/
    LIBS=-lucimf ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$pkgdir install
    
    rm -rf $srcdir/$_svnmod-build
}

