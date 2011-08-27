# Contributor: Emanuele Rossi <newdna1510@yahoo.it>

pkgname=qbriscola-svn
pkgver=910
pkgrel=1
pkgdesc="Italian Card Game named Briscola in qt4 interface"
url="http://www.qt-apps.org/content/show.php/QBriscola?content=83155"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt' 'sqlite3')
makedepends=('subversion' 'cmake' 'automoc4')

source=()
md5sums=()

_svntrunk=http://svn.assembla.com/svn/montoya83/qbriscola
_svnmod=qbriscola


build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  cmake  -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  rm -rf $startdir/src/$_svnmod-build
}
# vim:syntax=sh

