# Contributor: Tocer Deng <tocer.deng@gmail.com>
pkgname=acnchess-svn
pkgver=69
pkgrel=1
pkgdesc="another Chinese chess game coded by Alf"
arch=('i686' 'x86_64')
url="http://code.google.com/p/acnchess/"
license=('GPL2')
depends=('gtk2>=2.6.0')
source=()
md5sums=()

_svnmod="acnchess"
_svntrunk="http://acnchess.googlecode.com/svn/trunk/"

build() {
  cd "$srcdir/"
  msg "Getting source..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn --config-dir ../ up -r $pkgver)
  else
    svn --config-dir ./ co $_svntrunk  -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Creating make environment..."
  rm -rf $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build

  msg "Starting make..."

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
