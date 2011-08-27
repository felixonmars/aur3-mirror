# Maintainer: Gordin <9ordin @t gmail.com>
pkgname=qtwitgui
pkgver=104
pkgrel=1
pkgdesc="GUI for Wiimms ISO Tools"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qtwitgui/"
license=('GPL3')
groups=()
depends=('wit' 'qt')
source=()

_svntrunk=http://qtwitgui.googlecode.com/svn/trunk
_svnmod=trunk


build() {
    cd "$srcdir"

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    cd "$srcdir/$_svnmod-build/"


    #
    # BUILD
    #
    qmake || return 1
    make || return 1
    mkdir -p $pkgdir/usr/bin/
    install QtWitGui $pkgdir/usr/bin
}
