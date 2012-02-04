# Contributor: Igor Scabini <furester at gmail dot com>

pkgname=ei8k-module-svn
pkgver=7
pkgrel=1
pkgdesc="An E17 module to control and monitor fan speeds of Dell notebooks "
arch=('i686' 'x86_64')
url="http://code.google.com/p/ei8k-module/"
license=('BSD')
depends=('e-cvs')
makedepends=('subversion')
options=('!libtool')
source=()
md5sums=()

_svntrunk=http://ei8k-module.googlecode.com/svn/trunk/
_svnmod=ei8k-module-read-only

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
}
