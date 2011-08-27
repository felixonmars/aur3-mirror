# Contributor: totoloco <totoloco at gmail dot com>
pkgname=sqliteman-svn
pkgver=464
pkgrel=1
pkgdesc="The best developer's and/or admin's GUI tool for Sqlite3 in the world."
arch=('i686' 'x86_64')
url="http://sqliteman.com/"
license=('GPL2')
depends=('qt')
makedepends=('cmake')
provides=('sqliteman')
replaces=('sqliteman')
source=()
md5sums=()

_svntrunk=http://tools.assembla.com/svn/sqliteman/trunk/Sqliteman/
_svnmod=$srcdir

build() {
  msg "SVN checking out..."
  svn co $_svntrunk $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  #
  # BUILD
  #
  cd $srcdir
  cmake -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr .
  make || return 1
  make install
}
