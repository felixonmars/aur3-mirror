# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Diego Cano <elkano@blep.org>
pkgname=ube
pkgver=0.3.1
pkgrel=1
pkgdesc="A puzzle game, evolved from Boots-puzzle"
arch=('i686')
url="http://ph.on.things.free.fr/projects/ube/index.html"
license=('MIT')
depends=('gettext' 'sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'popt' 'boost')
makedepends=()
source=(http://ph.on.things.free.fr/projects/ube/releases/$pkgname-$pkgver.tar.gz)
md5sums=('2c61be0fc24ad0b220cf7da220333774')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
