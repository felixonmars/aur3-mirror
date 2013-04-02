# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=flare-rpg
pkgver=0.18
pkgrel=1
pkgdesc="open source action roleplaying game"
arch=('i686' 'x86_64')
url="http://flarerpg.org/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf')
makedepends=('cmake')
replaces=('osare')
source=(http://downloads.sourceforge.net/project/flare-game/flare-0.18.tar.gz)
md5sums=('4775a845694798f7df8b60b1303b8c37')
install=flare-rpg.install

build() {
  cd "$srcdir/flare-0.18"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare .
  make
}

package() {
  cd "$srcdir/flare-0.18"
  make install DESTDIR=$pkgdir
}

# vim:set ts=2 sw=2 et:
