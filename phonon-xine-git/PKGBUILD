# Maintainer:  Jekyll Wu <adaptee at gmail dot com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Marek Kubica <marek@xivilization.net>

realname=phonon
bename=xine
pkgname=${realname}-${bename}-git
pkgver=20110311
pkgrel=1
pkgdesc="GStreamer backend for phonon, the multimedia API of KDE."
arch=("i686" "x86_64")
url="http://projects.kde.org/projects/kdesupport/${realname}/${realname}-${bename}"
license=("LGPL")
depends=("${realname}" "xine-lib")
makedepends=("pkg-config" "cmake" "automoc4" "git")
provides=("${realname}-${bename}" "${realname}-backend")
conflicts=("${realname}-${bename}" )

_gitroot="git://anongit.kde.org/${realname}-${bename}.git"
_gitname="${realname}-${bename}"

build() {

    # Config
    [ ${CARCH} = 'x86_64' ] && CXXFLAGS="$CXXFLAGS -fPIC"

    cd ${srcdir}

    # Repository
    msg "Connecting to GIT server...."
    if [ -d ${_gitname} ] ; then
        cd ${_gitname} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_gitroot} ${_gitname}
        msg "GIT checkout done"
    fi


    if [ -d ${srcdir}/build ]; then
        rm ${srcdir}/build/* -rf
    else
        mkdir ${srcdir}/build/
    fi

    # Build
    cd ${srcdir}/build
    msg "Starting make..."

    { type -P kde4-config &>/dev/null && _prefix=$(kde4-config --prefix) ; } || _prefix=/usr
    cmake \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=$_prefix \
            -DPLUGIN_INSTALL_DIR=$_prefix/lib/kde4 \
            -DSERVICES_INSTALL_DIR=$_prefix/share/kde4/services \
            ../${_gitname}

    make || return 1
}


package () {
    cd ${srcdir}/build
    make DESTDIR=${pkgdir} install || return 1
}

