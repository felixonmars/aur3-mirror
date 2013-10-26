# Maintainer: SeeSchloss <see@seos.fr>
pkgname=dcoincoin-git

pkgver=2.0-28.f4a277e
_dccver=2.0
pkgrel=3
pkgdesc="DCoinCoin is a curses, D language, tribune feed reader"
arch=('i686' 'x86_64')
url="http://github.com/seeschloss/dcoincoin"
license=('MIT')
depends=('ncurses')
makedepends=('d-compiler' 'd-runtime' 'd-stdlib')
provides=('dcoincoin')
conflicts=('dcoincoin')
source=("$pkgname"::git+https://github.com/seeschloss/dcoincoin.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.%s.%s" "$_dccver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make PREFIX="$pkgdir/usr" install
}

