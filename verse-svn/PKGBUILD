# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=verse-svn
pkgver=4543
pkgrel=1
pkgdesc="Server and library for Verse network protocol"
arch=('i686' 'x86_64')
url="http://verse.blender.org/"
license=('BSD')
depends=('glibc')
makedepends=('subversion')
options=(!buildflags !makeflags)
source=(LICENSE)
md5sums=('0f8aec1eaffd10448e8f43eb63f23907')

_svntrunk="https://svn.blender.org/svnroot/verse/trunk/verse"
_svnmod="verse"

build() {
  cd "$srcdir"
  msg "Connecting to Blender SVN server......."
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod && svn up -r $pkgver
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  rm -rf "$srcdir"/$_svnmod-build
  cp -r "$srcdir"/$_svnmod "$srcdir"/$_svnmod-build

  msg "Starting make..."
  cd "$srcdir"/$_svnmod-build

  make
}

package() {
  cd "$srcdir"/$_svnmod-build

  install -D -m755 verse "$pkgdir"/usr/bin/verse
  install -D -m644 libverse.a "$pkgdir"/usr/lib/libverse.a
  install -D -m644 verse.h "$pkgdir"/usr/include/verse.h

  install -D -m644 "$srcdir/"LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
