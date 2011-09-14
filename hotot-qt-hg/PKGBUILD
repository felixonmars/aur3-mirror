pkgname=hotot-qt-hg
pkgver=1005
pkgrel=1
pkgdesc="Hotot QtWebkit Wrapper"
arch=('i686' 'x86_64')
url="http://hotot.org"
license=('GPLv2')
depends=('qt')
makedepends=('mercurial' 'cmake')
provides=(hotot-qt)
conflicts=('hotot-qt')
source=()
md5sums=()

_hgrepo=hotot
_hgroot=https://bitbucket.org/shellex

build(){
  cd "$srcdir"
  msg "Starting make..."
 
  rm -rf "$srcdir/build"
  mkdir -p $srcdir/build
  cd "$srcdir/build"
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../$_hgrepo
  make DESTDIR=${pkgdir}

}

package ()
{
    cd $srcdir/build
    make DESTDIR=${pkgdir} install
}
