# Maintainer: osily <ly50247 at 126 dot com>
# Contributor: Havanna

pkgname=iceplayer-svn
pkgver=28
pkgrel=1
pkgdesc="A simple music player"
license=('GPL')
arch=('i686' 'x86_64')
url="http://iceplayer.googlecode.com"
depends=('gstreamer0.10-ffmpeg' 'gstreamer0.10-ugly-plugins' 'gstreamer0.10-good-plugins' \
        'gstreamer0.10-base-plugins' 'mpfr' 'glib2' 'wget' 'libnotify')
makedepends=('subversion')
conflicts=('iceplayer')

_svntrunk=http://iceplayer.googlecode.com/svn/trunk/
_svnmod=iceplayer

build() {
    cd $srcdir/
    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn --config-dir ../ up -r $pkgver && cd ..)
    else
        svn --config-dir ./ co $_svntrunk -r $pkgver $_svnmod
    fi

    rm -rf $_svnmod-build
    cp -r $_svnmod $_svnmod-build

    cd $_svnmod-build
    sed -i '/#include <glib\/gtypes.h>/d' src/*.{h,c}
    ./build.sh || return 1
}

package() {
    cd $_svnmod-build/build
    make DESTDIR="$pkgdir" install || return 1
    cp -r ../data/skin $pkgdir/usr/share/iceplayer
}
