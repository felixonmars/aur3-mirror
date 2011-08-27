# Maintainer: TDY <tdy@gmx.com>

pkgname=searchmonkey-svn
pkgver=604
pkgrel=1
pkgdesc="A powerful GUI search utility for matching regex patterns"
arch=('i686' 'x86_64')
url="http://searchmonkey.sourceforge.net/"
license=('GPL')
depends=('qt')
makedepends=('subversion')
provides=('searchmonkey')
conflicts=('searchmonkey')

_svntrunk=https://searchmonkey.svn.sourceforge.net/svnroot/searchmonkey
_svnmod=searchmonkey

build() {
  cd "$srcdir"

  msg "Connecting to $_svnmod.svn.sourceforge.net..."
  if [[ -d $_svnmod/.svn ]]; then
    cd $_svnmod && svn up -r $pkgver && cd ..
    msg2 "Local files updated"
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    msg2 "SVN checkout done"
  fi

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/merges/searchmonkey_2_0

  msg "Starting make..."
  sed -i '13 a\#include <assert.h>' lib.cpp
  qmake searchmonkey_2_0.pro
  make || return 1
}

package() {
  cd "$srcdir/$_svnmod-build/merges/searchmonkey_2_0"
  install -Dm755 $_svnmod "$pkgdir/usr/bin/$_svnmod"
}
