# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: demonicmaniac@gmx.net
pkgname=bricks-engine
pkgver=5.3
pkgrel=1
epoch=
arch=('i686' 'x86_64')
pkgdesc="The Brick Engine is a fast, powerful, cross-platform, TOTALLY FREE 2D game engine."
url="http://rs.tc/br/"
license=('GPL')
groups=()
depends=('sdl' 'sdl_image' 'sdl_mixer')
makedepends=()
checkdepends=()
optdepends=('libgl')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://rs.tc/br/lib/exe/fetch.php/br-${pkgver}.tar.gz)
noextract=()
md5sums=('601ed69c0da0f1cbc3181940ef2eabde')


build() {
  cd "$srcdir/br-5"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  ccmake ..
  make 
}


package() {
  cd "$srcdir/br-5/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
