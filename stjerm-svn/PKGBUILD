# Contributor: Antonio Santos # asantosv at gmail dot com
# Maintainer: Andrea Fagiani <andfagiani {at} gmail {dot} com>
pkgname=stjerm-svn
_realname=stjerm
pkgver=294
pkgrel=1
pkgdesc="Drop-down terminal emulator, from SVN repository."
arch=('i686' 'x86_64')
url="http://code.google.com/p/stjerm-terminal"
license=('GPL')
depends=('vte')
makedepends=('autoconf' 'subversion')
provides=('stjerm')
conflicts=('stjerm')

_svntrunk=http://stjerm-terminal.googlecode.com/svn/trunk
_svnmod=stjerm-terminal-read-only

build() {
    cd ${srcdir}

    svn co $_svntrunk $_svnmod -r $pkgver
    cp -R $_svnmod $_svnmod-build
    cd $_svnmod-build

    export LIBS=-lXinerama
    ./autogen.sh
    ./configure --prefix=/usr
    make
    make DESTDIR="$pkgdir/" install
}
