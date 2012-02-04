# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
pkgname=libopensync-plugin-mozilla-svn
pkgver=5922
pkgrel=1
pkgdesc="Mozilla sync plugin for OpenSync"
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license=('LGPL2')
makedepends=('subversion' 'cmake')
depends=('libopensync')
provides=('libopensync-plugin-mozilla')
conflicts=('libopensync-plugin-mozilla')
source=()
md5sums=()

_svntrunk='http://svn.opensync.org/plugins/mozilla-sync'
_svnmod='libopensync-plugin-mozilla'

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

  #
  # BUILD
  #
  cmake $srcdir/$_svnmod -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}
