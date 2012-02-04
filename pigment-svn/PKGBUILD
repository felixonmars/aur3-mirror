# Contributor:  Jon Kristian Nilsen <jokr.nilsen@gmail.com>

pkgname=pigment-svn
pkgver=1609
pkgrel=1
pkgdesc="Development version of a GLib/GObject library designed to easily create rich UIs embedding several media types."
url="https://code.fluendo.com/pigment/trac"
arch=('any')
license=('GPL')
depends=('freeglut' 'libgl' 'gstreamer0.10-base' 'gtk2' 'gtk-doc')
makedepends=('subversion')
options=('!libtool')
conflicts=('pigment')
source=('Makefile.patch')
md5sums=('1196c89b2495fd4584e5344372d0eb34')

_svntrunk="https://code.fluendo.com/pigment/svn/trunk"
_svnmod="pigment"

build() {
    cd ${srcdir}

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    patch -Np1 -i Makefile.patch 

    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build/pigment

    ./autogen.sh --disable-gtk-doc --prefix=/usr
    make || return 1
    make DESTDIR=${pkgdir} install

    rm -rf ${srcdir}/$_svnmod-build
}