# Contributor: fancris3 <fancris3 at aol.com>

pkgname=itask-ng-svn
pkgver=739
pkgrel=2
pkgdesc="a taskbar and app-launcher dock, which makes use of composite, but can also be used without."
arch=('i686' 'x86_64')
url="http://code.google.com/p/itask-module/"
license=('BSD')
depends=('e-svn')
makedepends=('subversion' 'cvs' 'pkgconfig' 'automake' 'autoconf')
provides=('itask-ng')
options=('!libtool')
source=()
md5sums=()

_svntrunk=http://itask-module.googlecode.com/svn/trunk/itask-ng
_svnmod=itask-ng

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
  (cd $_svnmod && svn up -r $pkgver)
  else
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r $startdir/src/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
  install -D -m644 COPYING-PLAIN $startdir/pkg/usr/share/licenses/$pkgname/COPYING-PLAIN
}
