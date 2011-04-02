# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=elftoolchain-svn
pkgver=2011.04.02
pkgrel=1
pkgdesc="A BSD alternative to the GNU binutils"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/elftoolchain/"
license=('custom:BSD')
makedepends=('subversion' 'netbsd-pkgsrc')

conflicts=('binutils') # warning: not complete yet only on experimental systems!
provides=('binutils') #probably not yet, but aims to do so. Not drop-in replacement

_svntrunk=http://elftoolchain.svn.sourceforge.net/svnroot/elftoolchain/trunk

build() {

    svn co $_svntrunk

    rm -rf $srcdir/build
    cp -ar $srcdir/trunk $srcdir/build


msg "starting make"
    export TOP=$srcdir/build
    export OS_HOST=Linux
    export MAKESYSPATH=/usr/pkg/share/mk
    cd $srcdir/build
    bmake
  }

package() {
  cd $srcdir/build
  bmake DESTDIR=$pkgdir/usr install
}
