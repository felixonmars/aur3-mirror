# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
# Based on community/frogatto{,-data} PKGBUILD

pkgname='frogatto-svn'
arch=('i686' 'x86_64')
pkgver=4712
pkgrel=1
pkgdesc="An old-school 2d platformer game, starring a certain quixotic frog"
url="http://www.frogatto.com"
license=('GPL' 'custom')
depends=('libgl' 'mesa' 'glew' 'sdl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'libpng' 'boost-libs' 'gettext')
makedepends=('boost' 'subversion')
provides=()
conflicts=('frogatto' 'frogatto-data')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
source=(frogatto.sh
        frogatto.desktop)
md5sums=('9ed2c9ea59e95fe3c0b3ad49e58f8890'
         'e31563b04748a39292a59aaad633ff58')

_svntrunk=http://frogatto.com/svn/trunk
_svnmod=frogatto_svn

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
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  sed -i 's/ccache //g' Makefile
  sed -i 's/-lprofiler//g' Makefile
  sed -i 's/-lboost_\(regex\|system\|thread\|iostreams\)-mt/-lboost_\1/g' Makefile
  make game server
  make update-mo
}

package() {
  cd "$srcdir/$_svnmod-build"

  install -D -m755 game $pkgdir/opt/frogatto/game
  install -D -m755 server $pkgdir/opt/frogatto/server
  cp -r data $pkgdir/opt/frogatto/
  cp -r images $pkgdir/opt/frogatto/
  cp -r music $pkgdir/opt/frogatto/
  cp -r sounds $pkgdir/opt/frogatto/
  cp -r locale $pkgdir/opt/frogatto/
  install -D -m644 FreeMono.ttf $pkgdir/opt/frogatto/FreeMono.ttf
  install -D -m644 DejaVuSans.ttf $pkgdir/opt/frogatto/DejaVuSans.ttf

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/frogatto-svn/LICENSE

  cd $srcdir
  install -DT -m755 frogatto.sh $pkgdir/usr/bin/frogatto
  install -D -m644 frogatto.desktop $pkgdir/usr/share/applications/frogatto.desktop
}

# vim:set ts=2 sw=2 et:
