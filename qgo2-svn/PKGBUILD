# Maintainer: Vladimir Chizhov <master@mirlord.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=qgo2-svn
pkgver=766
pkgrel=1
pkgdesc='Go client and full featured SGF editor; svn-snapshot of the next major version'
arch=('i686' 'x86_64')
url='http://qgo.sourceforge.net/'
license=('GPL')
depends=('qt4')
makedepends=('subversion')
conflicts=('qgo' 'qgo2-cvs')
source=("svn+https://qgo.svn.sourceforge.net/svnroot/qgo/trunk"
        "qt4.patch")
md5sums=('SKIP'
         '82c35083c7a3a84650788c4411591507  ')

pkgver() {
  cd "$SRCDEST/trunk"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir/trunk"

  patch src/src.pro < ../qt4.patch
  ls src/translations/*.ts | sed 's/\.ts/\.qm/' | xargs touch

  qmake-qt4 QMAKE_CXXFLAGS="-fpermissive $CXXFLAGS" -o Makefile qgo.pro
  make
}

package() {
  cd "${srcdir}/trunk"
  QTDIR=/usr make INSTALL_ROOT="$pkgdir/" install
}

