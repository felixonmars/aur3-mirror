# Contributor: Rudolf Olah <omouse@gmail.com>
pkgname=crisscross-svn
pkgver=133
pkgrel=1
pkgdesc="CrissCross-svn is the latest version of the \
cross-platform C++ framework CrissCross"
url="http://uplinklabs.net/crisscross/"

depends=()
makedepends=('subversion')
conflicts=('crisscross')
provides=('crisscross')

source=()
md5sums=()

_svntrunk=http://crisscross.googlecode.com/svn/trunk
_svnmod=crisscross

build() {
  cd $startdir/src

  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd ../$_svnmod
  make main || return 1
  make prefix=$startdir/pkg install

  rm -r $startdir/src/$_svnmod
}