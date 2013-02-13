# Maintainer: Youcef Nafa <youcef.nafa@gmail.com>
pkgname=ronda
pkgver=0.1
pkgrel=1
pkgdesc="A Spanish card game"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/ronda-game/"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_ttf')
makedepends=('gcc')
checkdepends=()
optdepends=()
provides=('ronda')
conflicts=('ronda')
options=()
install=
changelog=
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}-game/${pkgname}-${pkgver}.tar.gz)
md5sums=('401908e0555d4930deab2e544c8d07c9')
noextract=()
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
