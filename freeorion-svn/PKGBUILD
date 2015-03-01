# Maintainer: cassfalg <ch.assfalg@gmx.de>
# Contributor: Christian Bühler <christian@cbuehler.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Elmo Todurov <todurov@gmail.com>
# Contributor: guini <sidtrun@googlemail.com>
# Contributor: Forrest Loomis <cybercyst _ at _ gmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: fana-m <geminin@gmx.net>

pkgname=freeorion-svn
pkgver=r7988
pkgrel=1
pkgdesc="Free Clone of Master of Orion."
url="http://www.freeorion.org/index.php/Main_Page"
arch=('i686' 'x86_64')
license=('GPL')
depends=('boost-libs' 'python2' 'sdl2' 'libvorbis' 'glew' 'openal' 'libtiff' 'libjpeg-turbo')
#makedepends=('subversion' 'cmake' 'dos2unix')
makedepends=('subversion' 'cmake')
provides=('freeorion')
conflicts=('freeorion')
install=freeorion.install
source=("svn+https://svn.code.sf.net/p/freeorion/code/trunk/FreeOrion"
        freeorion.install
        )
md5sums=(
        'SKIP'
        'e88e49fbe0f638775f6be9bbc824e070'
        )


pkgver() {
#  cd "$srcdir/SDL_Migration_And_Dependencies_Updates"
  cd "$srcdir/FreeOrion"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/FreeOrion-build"
  cd "$srcdir/FreeOrion-build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../FreeOrion
  make
}

package() {
  cd "$srcdir/FreeOrion-build"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
