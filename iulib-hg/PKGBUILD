# Contributor: Ilya Mezhirov <mezhirov@iupr.com>

pkgname=iulib-hg
pkgver=145
pkgrel=1
pkgdesc="A library of algorithms related to image understanding"
arch=('i686' 'x86_64')
url="http://code.google.com/p/iulib/"
license=('APACHE')
makedepends=('mercurial' 'scons')
depends=('gcc-libs' 'sdl_gfx' 'sdl_image')
conflicts=('iulib')
source=('remove-debug-info.patch')
md5sums=(be13d20ded36a6092681ec73d10ebba7)
#options=(!strip)

_hgroot="https://iulib.googlecode.com/hg/"
_hgrepo="iulib"

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
    msg "Starting scons..."


    rm -rf "$srcdir/$_hgrepo-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"
    patch -p1 <"$srcdir/remove-debug-info.patch"

    scons opt="-O3" prefix="$pkgdir/usr" sdl=1          || return 1
    scons opt="-O3" prefix="$pkgdir/usr" sdl=1 install  || return 1
}
