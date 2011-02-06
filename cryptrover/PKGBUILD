# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=cryptrover
pkgver=1.1
pkgrel=1
pkgdesc="Roguelike; guide an archaeologist through an underground crypt"
arch=('i686' 'x86_64')
url="http://$pkgname.googlecode.com/"
license=('GPL3')
depends=('ncurses')
source=($url/files/${pkgname}_${pkgver}_nosound.tar.gz)
md5sums=('65bd2963dcb71cf3203216482a745146')

build() {
  cd $pkgname

  sed 's|-Os||g;s|main.c|main.o|g' -i Makefile

  ./configure --without-sdl
  make STRIP=: || return 1
  install -Dm755 cr "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
