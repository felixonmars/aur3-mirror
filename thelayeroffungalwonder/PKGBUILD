# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Lakota Morris <lakota.james@gmail.com>
pkgname=thelayeroffungalwonder
pkgver=1.01
pkgrel=1
pkgdesc="A sidescrolling shooter/non-shooter inspired by Jeff Vandermeer's Ambergris."
arch=(any)
url="http://www.niallmoody.com/games.htm#TheLairOfFungalWonder"
license=('GPL, CC')
groups=()
depends=(sdl_ttf glew portaudio)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://downloads.niallmoody.com.s3.amazonaws.com/TheLairOfFungalWonder-$pkgver-src.tar.gz)
noextract=()
md5sums=('c2732752338c95c52bed2617967f4d89') #generate with 'makepkg -g'

build() {
  cd "$srcdir/TheLairOfFungalWonder-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/TheLairOfFungalWonder-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
