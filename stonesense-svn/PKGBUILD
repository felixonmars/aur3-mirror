# Maintainer: Klaas Boesche <aurkagebe _at_ googlemail.com>
pkgname=stonesense-svn
pkgver=964
pkgrel=1
pkgdesc="An isometric dwarf fortress visualizer."
arch=(i686 x86_64)
url="http://stonesense.googlecode.com"
license=('GPL' 'PerlArtistic')
depends=(allegro5 dfhack-git)
makedepends=('subversion' 'rsync')
provides=(stonesense)
source=(stonesense stonesense.desktop)

_svntrunk=http://stonesense.googlecode.com/svn/trunk
_svnmod=stonesense-source
_targetdir=$pkgdir/opt/stonesense

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
  cd "$srcdir/$_svnmod-build/build"

  #
  # BUILD
  #
  cmake .. -DCMAKE_BUILD_TYPE:string=Release
  make
}

package() {
  mkdir -p $_targetdir
  cd "$srcdir/$_svnmod-build"
  rsync -a --exclude=.svn buildings colors creatures Fluids \
    grasses terrain vegetation $_targetdir
  rsync -a Colors.xml creatures.png DejaVuSans.ttf engravings_floor.png \
    engravings_left.png engravings_right.png gibs.png index.txt init.txt \
    objects.png ramps.png ramptops.png SSStatusIcons.png stonesense.png \
    stonesense $_targetdir
  chown -R root:games $_targetdir
  chmod 2775 $_targetdir
  
  install -Dm755 "$srcdir/stonesense" "$pkgdir/usr/bin/stonesense"
  install -Dm644 "$srcdir/stonesense.desktop" \
    "$pkgdir/usr/share/applications/stonesense.desktop"
  install -Dm644 "$srcdir/$_svnmod-build/stonesense.png" \
    "$pkgdir/usr/share/pixmaps/stonesense.png"
  
}
md5sums=('d80d2ed676d7002b66346712ee2345f9'
         'cb1eb73da79035be8ec99a38bbc08f73')
