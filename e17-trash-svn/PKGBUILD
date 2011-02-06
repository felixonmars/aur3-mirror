# Contributor: Michele Gastaldo <pikiweb@gmail.com>

pkgname=e17-trash-svn
pkgver=241
pkgrel=2
pkgdesc="Trash module for e17 desktop"
arch=('i686' 'x86_64')
url="http://code.google.com/p/e17mods/wiki/Trash"
license=('GPL3')
depends=('e-svn')
makedepends=('subversion' 'pkgconfig' 'automake' 'autoconf')
options=('!libtool')
source=()
md5sums=()

_svntrunk=http://e17mods.googlecode.com/svn/trunk/MODULES/trash
_svnmod=trash

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
