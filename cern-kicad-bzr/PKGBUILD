# Maintainer: Michael Grey <liquibyte@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=cern-kicad-bzr
pkgver=r4875
pkgrel=1
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools CERN bzr branch"
arch=('i686' 'x86_64')
url="http://iut-tice.ujf-grenoble.fr/kicad/"
license=('GPL')
depends=('glew' 'wxgtk' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake' 'bzr' 'zlib' 'mesa')
optdepends=('kicad-docs-bzr: for documentation' 
            'kicad-library-bzr: for footprints'
            'git: github pcb plugin')
provides=('kicad')
conflicts=('kicad')
install=kicad.install
source=('bzr+lp:~cern-kicad/kicad/moduleeditor')
md5sums=('SKIP')
_bzrmod=moduleeditor

pkgver() {
  cd "$srcdir/$_bzrmod"
  echo "r$(bzr revno)"
}

build() {
  cd "$srcdir/$_bzrmod"
  mkdir -p build/Release
  cd build/Release
  cmake ../.. -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DKICAD_SKIP_BOOST=ON \
              -DBUILD_GITHUB_PLUGIN=ON
  make -j1
}

package() {
  cd "$srcdir/$_bzrmod/build/Release"
  make DESTDIR="$pkgdir" install
}
