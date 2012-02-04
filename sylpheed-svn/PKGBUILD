# Maintainer: TDY <tdy@gmx.com>

pkgname=sylpheed-svn
pkgver=2346
pkgrel=1
pkgdesc="A lightweight and easy-to-use mail client"
arch=('i686' 'x86_64')
url="http://sylpheed.sraoss.jp/en/"
license=('GPL' 'LGPL')
depends=('gpgme' 'gtkspell')
makedepends=('compface' 'svn')
provides=('sylpheed')
conflicts=('sylpheed' 'sylpheed-iconmod')

_svntrunk=svn://sylpheed.sraoss.jp/sylpheed/trunk
_svnmod=sylpheed

build() {
  cd "$srcdir"

  msg "Connecting to $_svnmod..."
  if [[ -d $_svnmod/.svn ]]; then
    cd $_svnmod && svn up -r $pkgver && cd ..
    msg2 "Local files updated"
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    msg2 "SVN checkout done"
  fi

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg "Starting make..."
  ./autogen.sh --prefix=/usr --enable-ldap
  make || return 1
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install
}
