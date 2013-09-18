# Maintainer: garion < garion @ mailoo.org >
# Contributor: grimi < grimi poczta dot fm >

pkgname=umplayer-svn
pkgver=181
pkgrel=4
pkgdesc="Multimedia player based on SMPlayer"
arch=('i686' 'x86_64')
url="http://www.umplayer.com"
license=('GPL')
depends=('qt4' 'mplayer' 'xdg-utils')
makedepends=('subversion')
provides=('umplayer')
conflicts=('umplayer')
install=$pkgname.install

_svntrunk=https://svn.code.sf.net/p/umplayer/code
_svnmod=umplayer

build() {
    cd $srcdir
    if [ -d $_svnmod/.svn ]; then
        cd $_svnmod && svn up -r $pkgver
        cd ..
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    rm -rf $_svnmod-build
    cp -r $_svnmod/$_svnmod $_svnmod-build

    cd $_svnmod-build/trunk
    sed -i 's/QMAKE=qmake/QMAKE=qmake-qt4/g' Makefile
    sed -i 's/LRELEASE=lrelease/LRELEASE=lrelease-qt4/g' Makefile

    make PREFIX=/usr
}

package() {
    cd $srcdir
    cd $_svnmod-build/trunk
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
