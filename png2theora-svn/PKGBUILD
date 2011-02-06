pkgname=png2theora-svn
pkgver=16987
pkgrel=1
pkgdesc="Example encoder application; makes an Ogg Theora file from a sequence of png images"
arch=('i686' 'x86_64')
url="http://www.theora.org"
license=('BSD')
depends=('libtheora' 'libpng')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=http://svn.xiph.org/trunk/theora-tools/
_svnmod=png2theora

build() {
    cd "$srcdir"

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up)
    else
        svn co $_svntrunk/$_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    cd "$srcdir/$_svnmod"
    gcc -c png2theora.c -o png2theora.o
    gcc -ltheora -ltheoraenc -ltheoradec -lpng  png2theora.o -o png2theora

    mkdir -p ${pkgdir}/usr/bin/
    install -D -m 755 png2theora ${pkgdir}/usr/bin/
}
