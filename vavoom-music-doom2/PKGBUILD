# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=vavoom-music-doom2
pkgver=1.0
pkgrel=1
pkgdesc="Enhanced Doom 2: Hell on Earth soundtrack for Vavoom"
url="http://www.vavoom-engine.com/"
depends=('vavoom' 'vavoom-music-doom1')
makedepends=('unzip')
source=(http://dl.sourceforge.net/sourceforge/vavoom/vmusic-doom2-1.0.zip)
md5sums=('c7e5bdb55ce706d701c8f9737efa3536')

build() {
  mkdir -p $startdir/pkg/usr/share/vavoom/basev/doom2
  install -m 644 $startdir/src/basev/doom2/* $startdir/pkg/usr/share/vavoom/basev/doom2/
}
