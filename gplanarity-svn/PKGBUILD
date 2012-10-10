# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Sebastien Duthil <duthils@free.fr>
pkgname=gplanarity-svn
pkgver=18638
pkgrel=1
pkgdesc="A simple puzzle game involving untangling planar graphs for fun and prizes"
arch=('i686' 'x86_64')
url="http://web.mit.edu/xiphmont/Public/gPlanarity.html"
license=('GPL')
depends=(gtk2)
makedepends=(subversion)
provides=(gplanarity)
conflicts=(gplanarity)
replaces=(gplanarity)
source=(gplanarity.desktop)
md5sums=('b9ab28c98c15f6898e6f9fbd7d6c1c20')

_svntrunk=http://svn.xiph.org/trunk/planarity/
_svnmod=planarity

build() {
    cd "$srcdir"

    if [ -d "$_svnmod/.svn" ]; then
        (cd "$_svnmod" && svn up -r "$pkgver")
    else
        svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
    fi

    msg "SVN checkout done or server timeout"

    # Create build directory
    if [ -d "$srcdir/$_svnmod-build" ] ; then

        # Need 'force' option to delete .svn directory (has read-only files)
        rm -rf "$srcdir/$_svnmod-build"
    fi
    cp -r "$_svnmod" "$_svnmod-build"
    cd "$_svnmod-build"

    msg "Starting make..."

    # Disable NLS, or it won't compile
    if test "$CARCH" == x86_64; then
        make DISABLE_NLS=true LIBS=-lm
    else
        make DISABLE_NLS=true
    fi
}

package() {
    install -Dm755 "$srcdir/gplanarity.desktop" "$pkgdir/usr/share/applications/gplanarity.desktop"
    install -Dm755 "$_svnmod-build/gPlanarity" "$pkgdir/usr/bin/gplanarity"
    install -Dm755 "$_svnmod-build/gPicon.png" "$pkgdir/usr/share/pixmaps/gplanarity.png"
}
