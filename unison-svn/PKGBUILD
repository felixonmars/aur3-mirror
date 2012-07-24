pkgname=unison-svn
pkgver=498
pkgrel=1
pkgdesc="Bi-directional file synchronization."
arch=(i686 x86_64)
license=('GPL2')
url="http://www.cis.upenn.edu/~bcpierce/unison"
depends=('glibc')
makedepends=('ocaml' 'svn')
conflicts=('unison' 'unison-beta')
options=(!makeflags)
_svntrunk="https://webdav.seas.upenn.edu/svn/unison/trunk"
_svnmod="unison"
unset CFLAGS

build () {
    cd "$srcdir"
    if [[ -d $_svnmod/.svn ]]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir . -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    cd "$srcdir/$_svnmod-build"

    make UISTYLE=text DEBUGGING=false NATIVE=true THREADS=true
}

package () {
    cd "$srcdir/$_svnmod-build"
    mkdir -p "$pkgdir/usr/bin"
    make install INSTALLDIR="$pkgdir/usr/bin/"
    #install -Dm755 unison "$pkgdir/usr/bin/unison"
}
