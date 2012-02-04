# Contributor: Vladimir Kutyavin <vlkut-at-bk-dot-ru>
# Maintainer: Aleksuk Artyom <h31mail@yandex.com>

pkgname=psimedia-plus-svn
pkgver=737
pkgrel=2
pkgdesc="Voice and video chat plugin for Psi-like IM clients. The implementation is based on GStreamer. Patched by Psi-plus team."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://code.google.com/p/psi-dev/"
depends=('psi' 'speex' 'gstreamer0.10-base' 'qt' 'gstreamer0.10-good-plugins' 'liboil')
makedepends=('pkgconfig' 'qconf-svn')
conflicts=('psimedia')
provides=('psimedia')
source=()
_svntrunk="http://delta.affinix.com/svn/trunk/psimedia"
_svnmod="psimedia"
_patchessvntrunk="http://psi-dev.googlecode.com/svn/trunk/patches/psimedia"
_patchessvnmod="patches"

build() {
    cd $srcdir

    msg "Getting psimedia from SVN"
    msg "connecting to $_svntrunk/$_svnmod"
        if [ -d $srcdir/$_svnmod ] ; then
            svn up $_svnmod
            msg "$srcdir/$_svnmod"
        else
            svn checkout $_svntrunk $srcdir/$_svnmod
        fi
    msg "SVN Checkout done or server timeout"

# There are no patches from a Psi-plus team yes, so build vanilla code.

    msg "Getting patches from SVN"
    msg "connecting to $_patchessvntrunk/$_patchessvnmod"
        if [ -d $srcdir/$_patchessvnmod ] ; then
            svn up $_patchessvnmod
            msg "$srcdir/$_patchessvnmod"
        else
            svn checkout $_patchessvntrunk $srcdir/$_patchessvnmod
        fi
    msg "SVN Checkout done or server timeout"

    if [ -d $srcdir/$_svnmod-build ] ; then
        rm -rf $srcdir/$_svnmod-build
    fi

    svn export $_svnmod $_svnmod-build

    cd $_svnmod-build

    msg "Copying patches to build directory"
        rm -rf patches
        mkdir patches
        cp -r $srcdir/$_patchessvnmod/* .

    msg "Applying patches"
#        cd patches/
        rm -f *-win32-*         #useless windows patches
        rm -f *dirty-check*         #useless update check

        for i in *.diff; do
            pn=$(basename $i)
            msg2 "Applying '$pn'"
            patch -p1 < "$i"
        done

    qconf || return 1
    ./configure || return 1
    make || return 1
    install -D -m644 ${srcdir}/$_svnmod-build/gstprovider/libgstprovider.so ${pkgdir}/usr/lib/psi/plugins/libgstprovider.so
}

