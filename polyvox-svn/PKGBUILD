# Maintainer: Marius Dransfeld <marius.dransfeld@googlemail.com>

pkgname=polyvox-svn
pkgver=1373
pkgrel=1
pkgdesc="PolyVox is a library for storing, manipulating, and displaying volumetric representations of objects"
arch=('i686' 'x86_64')
url="http://www.thermite3d.org/joomla/index.php?option=com_content&view=article&id=31&Itemid=8"
license=('zlib')
makedepends=('subversion' 'cmake')
provides=(polyvox)
conflicts=(polyvox)

_svntrunk=https://thermite.svn.sourceforge.net/svnroot/thermite/PolyVox/trunk/
_svnmod=PolyVox

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
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/"
}
