# Maintainer: Xiaoan Wu <adaptee at gmail dot com>

pkgname=qterm-svn
pkgver=1318
pkgrel=1
pkgdesc="BBS client for Linux, written in Qt"
arch=('i686' 'x86_64')
url="http://www.qterm.org"
license=('GPL')
depends=('qt4' 'openssl')
makedepends=('cmake' 'subversion')
provides=('qterm')
conflicts=('qterm')

source=("svn+https://qterm.svn.sourceforge.net/svnroot/qterm/trunk/qterm-qt4")
md5sums=('SKIP')
_svnmod="qterm-qt4"

pkgver() {
  cd "$SRCDEST/$_svnmod"
  svnversion | tr -d [A-z]
}

build()
{

    cd "$srcdir/$_svnmod"

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DQTERM_ENABLE_PHONON=OFF .
    make 
}

package ()
{
    cd "$srcdir/$_svnmod"
    make DESTDIR="$pkgdir/" install
}


