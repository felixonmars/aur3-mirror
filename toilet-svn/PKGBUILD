# Contributor: mickael9 <mickael9 at gmail dot com>
pkgname=toilet-svn
pkgver=4682
pkgrel=1
pkgdesc="free replacement for the FIGlet utility (svn version)"
arch=(i686 x86_64)
url="http://caca.zoy.org/wiki/toilet"
license=(WTFPL)
depends=(zlib "libcaca-svn")
makedepends=('subversion')
provides=(toilet)
conflicts=(toilet)

_svntrunk=svn://svn.zoy.org/caca/toilet/trunk
_svnmod=toilet

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  ./bootstrap
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
