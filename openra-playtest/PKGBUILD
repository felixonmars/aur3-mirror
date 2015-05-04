# $Id$
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Oliver Jan Krylow <okrylow@gmail.com>
# Contributor: Matthew Bowra-Dean <matthew@ijw.co.nz>
pkgname=openra-playtest
pkgver=20150424
pkgrel=1
pkgdesc="An open-source implementation of the Red Alert engine (playtest)"
arch=('any')
url="http://openra.net"
license=('GPL3')
install=openra.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'zenity' 'nuget' 'nuget-cert')
makedepends=('git')
options=(!strip)
source=("git+https://github.com/OpenRA/OpenRA.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/OpenRA"

  # git describe --tags --abbrev=0 --match playtest* | sed 's/playtest-//'
  git describe --tags $(git rev-list --tags --max-count=1) --abbrev=0 --match playtest* | sed 's/playtest-//'
}

prepare() {
  cd "$srcdir/OpenRA"

  git checkout playtest-$pkgver

  make version
}

build() {
  cd OpenRA

  ./configure
  make dependencies
  make all
}

package() {
  cd OpenRA

  make prefix=/opt/openra DESTDIR="$pkgdir" install-all
  make prefix=/opt/openra DESTDIR="$pkgdir" install-linux-shortcuts
}
