# Maintainer: Hector A Escobedo <ninjahector dot escobedo at gmail dot com>

pkgname=fortune-mod-homestuck-git
pkgver=r33.151e14b
pkgrel=1
pkgdesc="Colorized quotes from characters in the Homestuck webcomic"
arch=('any')
url="http://mspaintadventures.com/"
license=('None')
depends=('fortune-mod')
makedepends=('git' 'm4' 'make' 'ncurses')
install=usage.install
source=(git://github.com/HectorAE/fortunes.git)
md5sums=('SKIP')

_gitname=fortunes

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  ./configure
  make clean # Be careful that no .dat files already exist, otherwise .dat.dat happens!
  for i in src/homestuck/*; do
      make ${i%.m4}.dat
  done
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
