pkgname=pyopenfst-hg
pkgver=49
pkgrel=1
pkgdesc="Python bindings for OpenFST"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ocropus/"
license=('APACHE')
makedepends=('mercurial' 'scons')
depends=('openfst' 'python2')
source=(pyopenfst.patch)
md5sums=('d31d42312b7f279b9a226d8a0f69a294')

_hgroot="https://pyopenfst.googlecode.com/hg/"
_hgrepo="pyopenfst"

build() {
    cd "$srcdir"
    msg "Connecting to Mercurial server...."

    if [ -d $_hgrepo ] ; then
        cd $_hgrepo
        hg pull -u || return 1
        msg "The local files are updated."
    else
        hg clone $_hgroot $_hgrepo || return 1
    fi

    msg "Mercurial checkout done or server timeout"
    rm -rf "$srcdir/$_hgrepo-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"

    patch -Np1 -i $srcdir/pyopenfst.patch

    make INSTALL_OPTS="--root=$pkgdir"
}
