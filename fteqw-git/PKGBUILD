# Maintainer: qs9rx < that nick at enjoys döt it>
pkgname=fteqw-git
pkgver=4150
pkgrel=1
pkgdesc="A modern Quake 1 engine with many advanced features. Supports Quake 2, Quake 3 Arena, Hexen 2 and QTest too. Client and server. Git version."
arch=('i686' 'x86_64')
url="http://www.fteqw.com/"
license=('GPL2')
depends=('libxxf86dga' 'libxxf86vm' 'libvorbis' 'libjpeg' 'libpng')
makedepends=('subversion' 'make')
optdepends=('speex')
install=$pkgname.install

_svntrunk=https://fteqw.svn.sourceforge.net/svnroot/fteqw/trunk/engine/
_svnmod=engine

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  msg "Starting make..."
  cd "engine/"
  make gl-rel
  make sv-rel
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,share/licenses}
  install -m755 $srcdir/engine/release/fteqw.* "$pkgdir"/usr/bin/
  install -Dm644 $srcdir/engine/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
