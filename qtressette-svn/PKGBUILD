# Contributor: Emanuele Rossi <newdna1510@yahoo.it>

pkgname=qtressette-svn
pkgver=914
pkgrel=1
pkgdesc="Italian Card Game named Tressette in qt4 interface"
license=('GPL')
arch=('i686' 'x86_64')
url=('http://toastedtech.wordpress.com/')
depends=('qt' 'sqlite3')
makedepends=('subversion' 'cmake' 'automoc4')

source=()
md5sums=()

_svntrunk=http://svn.assembla.com/svn/montoya83/qTressetteN
_svnmod=qtressette


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

  qmake
  make || return 1
  mkdir $startdir/pkg/usr/ 
  mkdir $startdir/pkg/usr/bin
  cp ./bin/qTressette $startdir/pkg/usr/bin/qtressette

  rm -rf $startdir/src/$_svnmod-build
}
# vim:syntax=sh

