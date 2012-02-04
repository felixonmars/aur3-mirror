# Contributor: Mildred <mildred593 at online dot fr>

pkgname=guessnet
pkgver=svn
pkgrel=20070309
pkgdesc="Guess network configuration"
url="http://guessnet.alioth.debian.org/"

makedepends=('subversion' 'autoconf' 'automake' 'make' 'tut-framework' 'libnet' 'libwibble')
depends=('libnet' 'libwibble')
conflicts=('guessnet')
replaces=('guessnet')
provides=('guessnet')
options=()

install=()
source=()
md5sums=()

_svntrunk="svn://svn.debian.org/guessnet/trunk"
_svnmod="guessnet"

_log() {
    msg "$*"
    "$@"
    return $?
}

build() {
    cd "$startdir/src/"                         || return 1
    if [ -d guessnet ]; then
        cd guessnet                             || return 1
        _log svn up                             || return 1
    else
        _log svn co "${_svntrunk}" "${_svnmod}" || return 1
        cd guessnet                             || return 1
    fi
    #msg "Disable tests"
    #_log sed -i.bak 's/SUBDIRS = src scripts tests/SUBDIRS = src scripts/' Makefile.am || return 1
    _log ./autogen.sh                           || return 1
    _log ./configure --prefix=/usr              || return 1
    _log make                                   || return 1
    _log make DESTDIR="$startdir/pkg/" install  || return 1
}
