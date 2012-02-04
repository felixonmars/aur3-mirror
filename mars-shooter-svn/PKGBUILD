# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=mars-shooter-svn
pkgver=192
pkgrel=1
pkgdesc="A ridiculous space shooter with nice graphics"
arch=(i686 x86_64)
url="http://mars-game.sourceforge.net/"
license=('GPL')
depends=('sfml-git' 'taglib' 'fribidi')
makedepends=('cmake' 'subversion')
provides=('mars-shooter')
conflicts=('mars-shooter')
source=()
md5sums=()

_svntrunk=https://mars-game.svn.sourceforge.net/svnroot/mars-game
_svnmod=mars-game

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

  cd build && cmake ..
  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  mkdir -p $pkgdir/usr/share/marsshooter
  mkdir -p $pkgdir/usr/bin/
  cp -r credits.txt data/* license.txt $pkgdir/usr/share/marsshooter
  cp mars $pkgdir/usr/bin/mars-shooter
  find $pkgdir -name *.svn | xargs rm -rf

  sed -i 's/Exec=.*/Exec=mars-shooter/g' resources/mars.desktop
  install -Dm644 resources/mars.desktop $pkgdir/usr/share/applications/mars.desktop
  install -Dm644 resources/mars.png $pkgdir/usr/share/pixmaps/mars.png
}
