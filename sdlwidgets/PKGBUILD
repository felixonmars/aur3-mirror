# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=sdlwidgets
pkgver=1.0.3
pkgrel=1
pkgdesc="SDL widgets"
arch=('i686' 'x86_64')
url="http://www.thelas.dk/index.php/SdlWidgets"
license=('GPL')
groups=()
depends=('sdl' 'sdl_image' 'sdl_gfx' 'sdl_ttf' 'freetype2')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://www.thelas.dk/images/b/b2/Sdlwidgets-$pkgver.tgz Makefile.in)
noextract=()

md5sums=('81eb2bba1c36b2903737948a44ee6992'
         '8645c4274ba9404467be0dc1ee2cee32')





build() {
  cp Makefile.in $srcdir/sdlwidgets-$pkgver-a/
  cd "$srcdir/sdlwidgets-$pkgver-a"
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/bin
  echo $pkgdir
  export PKGDIR=$pkgdir
  make config || return 1
  make build || return 1
  make install || return 1
}

# vim:set ts=2 sw=2 et:
