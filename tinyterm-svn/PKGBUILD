# Contributor: Jonas Haag <jonas@lophus.org>

pkgname=tinyterm-svn
pkgver=20100223
pkgrel=1
pkgdesc="Very lightweight terminal emulator based on VTE"
arch=('x86_64' 'i686')
url="http://code.google.com/p/tinyterm/"
license=('GPLv2')
depends=('vte')
makedepends=('subversion cmake')

_svnroot="http://tinyterm.googlecode.com/svn/trunk/"
_svnname="tinyterm"

build() {
    cd "$srcdir"
    msg "Checking out from SVN..."

    if [ -d $_svnname ] ; then
        cd $_svnname && svn up
        msg "The local files are updated."
    else
        svn co $_svnroot $_svnname
    fi

    msg "SVN checkout done or server timeout"

    msg "Starting make..."

    rm -rf "$srcdir/$_svnname-build"
    cp -r "$srcdir/$_svnname" "$srcdir/$_svnname-build"
    cd "$srcdir/$_svnname-build"

    cmake . || return 1
    make || return 1

    mkdir -p $pkgdir/usr/bin
    install -m 755 tinyterm $pkgdir/usr/bin/tinyterm
}

