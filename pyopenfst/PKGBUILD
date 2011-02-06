pkgname=pyopenfst
pkgver=41
pkgrel=1
pkgdesc="Python openfst"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ocropus/"
license=('APACHE')
makedepends=('mercurial' 'scons' 'openfst')
depends=('gcc-libs' 'sdl_gfx' 'sdl_image' 'iulib-hg')
source=(build_fix.diff)
md5sums=('c47f51ca529165f9fed7f082056f2dc6')

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


    cd "$srcdir/$_hgrepo"

    patch < $srcdir/build_fix.diff

    make INSTALL_OPTS="--root=$pkgdir"
}
