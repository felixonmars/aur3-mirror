# Contributor: MeMi69  MetalMilitia at gmx dot net

pkgname=lyrics-plasmoid
pkgver=0.5
pkgrel=1
pkgdesc="A Plasmoid Widget to see the lyrics of the current playing song"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Lyrics+Plasmoid?content=135292"
license=('LGPL')
groups=()
depends=('kdelibs>=4.3')
makedepends=('gcc' 'cmake' 'automoc4')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(http://downloads.sourceforge.net/project/lyricsplasmoid/releases/$pkgver/lyricsplasmoid-$pkgver.tar.bz2)
noextract=()
md5sums=('344c83101288246489d124aa458c9486')
build() {
  cd $srcdir/lyricsplasmoid-$pkgver
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
