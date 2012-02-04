pkgname=invertika-server-svn
pkgver=2291
pkgrel=1
pkgdesc="Server for Invertika, based on The Mana World (tmwserv)"
arch=('any')
url="http://invertika.org/"
license=('GPL2')
makedepends=('subversion' 'cmake')
depends=('enet-old' 'libxml2' 'lua' 'physfs' 'sqlite3')
provides=('invertika-server')
_svntrunk="http://invertika.googlecode.com/svn/tags/1879-semistable-client-server/server/"
_svnmod=invertika-server

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co "$_svntrunk" --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/usr"
  make
  make DESTDIR="$pkgdir/" install
}
