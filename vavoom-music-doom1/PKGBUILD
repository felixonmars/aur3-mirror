# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=vavoom-music-doom1
pkgver=1.0
pkgrel=1
pkgdesc="Enhanced Doom/Ultimate Doom soundtrack for Vavoom"
url="http://www.vavoom-engine.com/"
depends=('vavoom')
makedepends=('unzip')
source=(http://dl.sourceforge.net/sourceforge/vavoom/vmusic-doom1-1.0.zip)
md5sums=('4a894a20b76f78baa5dfccc092566360')

build() {
  mkdir -p $startdir/pkg/usr/share/vavoom/basev/doom
  mkdir -p $startdir/pkg/usr/share/vavoom/basev/doom1
  install -m 644 $startdir/src/basev/doom/* $startdir/pkg/usr/share/vavoom/basev/doom/
  install -m 644 $startdir/src/basev/doom1/* $startdir/pkg/usr/share/vavoom/basev/doom1/
}
