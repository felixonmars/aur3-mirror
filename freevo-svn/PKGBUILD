pkgname=freevo-svn
pkgver=110406
pkgrel=1
pkgdesc="An open-source home theatre PC platform"
url="http://freevo.sourceforge.net/"
license=""
depends=('kaa')
makedepends=('python')
provides=('freevo')
conflicts=('freevo')
replaces=('freevo')
backup=()
install=
source=()
md5sums=()

_svntrunk=svn://svn.freevo.org/freevo/trunk
_svnmod=freevo

build() {
  cd $startdir/src/
  svn co $_svntrunk $_svnmod
  cd $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  python setup.py build
  python setup.py install --prefix=$startdir/pkg/usr
    
}
