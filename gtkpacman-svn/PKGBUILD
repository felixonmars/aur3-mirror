#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: oke3 <Sekereg [at] gmx [dot] com>
# Contributor: seti <seti4ever@gmail.com>

pkgname=gtkpacman-svn
pkgver=217
pkgrel=2
pkgdesc="GTK package manager for archlinux based on pacman (svn version)"
url="http://gtkpacman.berlios.de"
license=("GPL2")
arch=("i686" "x86_64")
provides=('gtkpacman')
conflicts=('gtkpacman')
depends=('pygtk' 'vte')
makedepends=('subversion')

_svntrunk="http://svn.berlios.de/svnroot/repos/gtkpacman/trunk"
_svnmod="gtkpacman"

build () {
    cd "$srcdir"
    msg "Connecting to SVN server...."

    if [[ -d "$_svnmod/.svn" ]]; then
        (cd "$_svnmod" && svn up -r "$pkgver")
    else
         svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
}

package() {    
    cd "$srcdir/$_svnmod-build"

    python2 setup.py install --root="$pkgdir"
}