# Maintainer: AndyWxy <andy.bio@gmail.com>

pkgname=libucimf-svn
pkgver=321
pkgrel=1
pkgdesc="Unicode Console InputMethod Frameword - a input plugin under Framebuffer Console environment."
arch=("i686")
license=('GPL')
url="http://code.google.com/p/ucimf"
depends=('freetype2')
makedepends=('subversion')
source=()
md5sums=()

_svnmod="libucimf"
_svntrunk="http://ucimf.googlecode.com/svn/libucimf"

build() {

    cd $startdir/src/
    msg "Getting svn sources..."
    svn co $_svntrunk $_svnmod -r $pkgver
    [ -d $_svnmod-build ] && rm -r $_svnmod-build
    cp $_svnmod $_svnmod-build -r || return 1
    cd $_svnmod-build || return 1

    msg "Starting build..."
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc
    make || return 1
    make DESTDIR=$pkgdir install

    rm -rf $srcdir/$_svnmod-build
}

