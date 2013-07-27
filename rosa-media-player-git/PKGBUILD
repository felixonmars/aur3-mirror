# Maintainer: Vítor Ferreira <vitor.dominor@gmail.com>
_pkgname=rosa-media-player
pkgname=$_pkgname-git
pkgver=1.6.25.g6972688
pkgrel=1
pkgdesc="The new multimedia player(based on SMPlayer) with clean and elegant UI."
arch=(i686 x86_64)
url="https://abf.rosalinux.ru/uxteam/ROSA_Media_Player"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('mplayer' 'wget' 'qjson')
optdepends=('mencoder: video splitting support'
            'ffmpeg: audio cutting and video recording support'
            'rosa-media-player-plugin: mozilla plugin'
            'wildmidi: midi support'
            'timidity-freepats: midi support')
makedepends=('qt4' 'qjson')
install="$_pkgname".install
source=('git+https://abf.rosalinux.ru/uxteam/ROSA_Media_Player.git')
md5sums=('SKIP')

_gitroot=https://abf.rosalinux.ru/uxteam/ROSA_Media_Player.git
_gitname=ROSA_Media_Player

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {

  cd $srcdir/$_gitname/$_pkgname
  
  # Get upstream pkgver and release
  #_pkgver=`sed -nre 's/Version:[ \t][^0-9]*(([0-9]+\.)*[0-9]+).*/\1/p' "$srcdir/$_gitname/$_pkgname.spec"`
  #_upstream_rel=`sed -nre 's/Release:[ \t][^0-9]*(([0-9]+)*)/\1/p' "$srcdir/$_gitname/$_pkgname.spec"`
  
  _pkgver=`git describe --always | cut -c -3`
  _upstream_rel=`git describe --always | cut -c 5-`

  #
  # BUILD HERE
  #
  ./get_romp_version.sh $_pkgver $_upstream_rel
  make PREFIX=/usr QMAKE=/usr/bin/qmake-qt4 LRELEASE=/usr/lib/qt4/bin/lrelease no-midi-support
}

package() {

  cd $srcdir/$_gitname/$_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
