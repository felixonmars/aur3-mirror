# Maintainer: Jakub Kulhan <jakub.kulhan at gmail dot com>

pkgname=php-vld-svn
pkgver=634
pkgrel=1
pkgdesc="The Vulcan Logic Dumper hooks into the Zend Engine and dumps all the opcodes (execution units) of a script. It can be used to see what is going on in the Zend Engine."
arch=('i686' 'x86_64')
url="http://derickrethans.nl/projects.html"
license=('BSD')
depends=('php')
makedepends=('php' 'make' 'subversion' )
provides=('php-vld')
conflicts=()
source=('vld.ini')
md5sums=('1a45cf67f22855e2279e98aaeb63ca9a')
_svntrunk="svn://svn.xdebug.org/svn/php/vld/trunk"
_svnmod="vld"

build() {
    svn co $_svntrunk $_svnmod
    msg "SVN checkout done or server timeout"
    msg "Starting make..."
    cd $srcdir/$_svnmod
    phpize
    ./configure
    make
    mkdir -p $pkgdir/usr/lib/php/modules
    cp $srcdir/$_svnmod/modules/vld.so $pkgdir/usr/lib/php/modules
    mkdir -p $pkgdir/etc/php/conf.d
    cp $srcdir/vld.ini $pkgdir/etc/php/conf.d
    rm -rf $srcdir/$_svnmod
}
