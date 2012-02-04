# Contributor: graziano <graziano.giuliani@poste.it>

pkgname=clanlib-svn
pkgver=1014
pkgrel=1
pkgdesc="A multi-platform game development library"
arch=("i686" "x86_64")
depends=('libxmu' 'libxi' 'mesa' 'libjpeg' 'libpng' 'libmikmod' 'libvorbis' 'sdl_gfx>=2.0.13')
makedepends=('subversion')
conflicts=('clanlib')
provides=('clanlib')
url="http://www.clanlib.org/"
source=()
license=('custom')
md5sums=()
options=(!libtool)

_svntrunk=svn://esoteric.clanlib.org/ClanLib/Development/ClanLib-0.8
_svnmod=clanlib-svn

build() {
    cd $startdir/src

    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build

    ./autogen.sh

    ./configure --prefix=/usr \
                --disable-static \
                --enable-clanDisplay \
                --enable-clanGL \
                --enable-clanSound \
                --enable-clanNetwork \
                --enable-clanGUI  \
                --enable-clanMikMod \
                --enable-clanVorbis

    make || return 1
    make DESTDIR=$startdir/pkg install
    mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
    install -m 644 COPYING $startdir/pkg/usr/share/licenses/$pkgname
}
