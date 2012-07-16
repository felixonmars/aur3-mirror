# Contributor: MeMi69  MetalMilitia at gmx dot net

pkgname=kdeplasma-applets-lyrics
pkgver=0.5
pkgrel=1
pkgdesc="A Plasmoid Widget to see the lyrics of the current playing song"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Lyrics+Plasmoid?content=135292"
license=('LGPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('lyrics-plasmoid')
replaces=('lyrics-plasmoid')
source=("http://downloads.sourceforge.net/lyricsplasmoid/lyricsplasmoid-$pkgver.tar.bz2")
md5sums=('344c83101288246489d124aa458c9486')

build() {
  mkdir build
  cd build
  cmake ../lyricsplasmoid-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}