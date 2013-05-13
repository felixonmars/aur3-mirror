pkgname=mirage-svn
pkgver=400
pkgrel=1
pkgdesc="A simple GTK+ Image Viewer (SVN Version)"
arch=('i686' 'x86_64')
url="http://mirageiv.berlios.de/"
license="GPL"
depends=('pygtk')
makedepends=('subversion')
conflicts=('mirage')
provides=('mirage')
source=()
install=$pkgname.install
md5sums=()

_svntrunk=http://svn.berlios.de/svnroot/repos/mirageiv/trunk
_svnmod=mirage

pkgver() {
  cd $srcdir/$_svnmod
  svnversion
}

build() {
  cd $srcdir

  msg "Connecting to $_svnmod SVN server..."
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod && svn up
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
}

package() {
  cd $srcdir/$_svnmod
  msg "Starting make..."
  python2 setup.py install --root=$pkgdir
}
