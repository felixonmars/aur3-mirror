# Maintainer: Kunwei Zhang <aceeca.135531@gmail.com>

pkgname=qterm-svn-qt5
pkgver=1318
pkgrel=1
pkgdesc="BBS client for Linux, written in Qt5"
arch=('i686' 'x86_64')
url="http://www.qterm.org"
license=('GPL')
depends=('qt5-base' 'openssl')
makedepends=('cmake' 'subversion')
provides=('qterm')
conflicts=('qterm')

source=("svn+https://qterm.svn.sourceforge.net/svnroot/qterm/trunk/qterm")
md5sums=('SKIP')
_svnmod="qterm"

pkgver() {
  cd "$SRCDEST/$_svnmod"
  svnversion | tr -d [A-z]
}

build()
{
    cd "$srcdir/$_svnmod"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT5=YES .
    make
}

package ()
{
    cd "$srcdir/$_svnmod"
    make DESTDIR="$pkgdir/" install
}
