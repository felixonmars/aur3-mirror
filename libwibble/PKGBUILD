# Contributor: Mildred <mildred593 at online dot fr>

pkgname=libwibble
pkgver=0.1.6
pkgrel=2
pkgdesc="collect useful bits and pieces of C++ code"
url="http://web.mornfall.net/libwibble.html"

makedepends=('darcs' 'cmake' 'tut-framework' 'boost')
depends=('boost')
conflicts=()
replaces=()
provides=()
options=()

install=()
source=()
md5sums=()

_trunk="http://repos.mornfall.net/libwibble/"

_log() {
    msg "$*"
    "$@"
    return $?
}

build() {
    cd "$startdir/src/"                     || return 1
    if [ -d libwibble ]; then
        cd libwibble                        || return 1
        if [ darcs = "$pkgver" ]; then
            _log darcs pull                 || return 1
        fi
    else
        if [ darcs = "$pkgver" ]; then
            _log darcs get "${_trunk}"      || return 1
        else
            _log darcs get --tag="$pkgver" "${_trunk}" || return 1
        fi
        cd libwibble                        || return 1
    fi
    [ -d build ] || _log mkdir build
    cd build                                || return 1
    #msg "in `pwd`"
    #for f in ../wibble/tests.h ../wibble/tests.cpp; do
    #    if [ -e "$f" ]; then
    #        _log mv "$f" "$f.old"           || return 1
    #    fi
    #done
    #msg "Patching ../wibble/CMakeLists.txt"
    #sed \
    #    's/ADD_SUBDIRECTORY( tests )/# ADD_SUBDIRECTORY( tests )/' \
    #    ../wibble/CMakeLists.txt \
    #    | sed 's/XXX_BUILD_TESTING/NO/' \
    #    > CMakeLists.txt.new                || return 1
    #cat CMakeLists.txt.new \
    #    > ../wibble/CMakeLists.txt          || return 1
    _log cmake \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        ..                                  || return 1
    _log make                               || return 1
    _log make DESTDIR="$startdir/pkg/" install || return 1
}
