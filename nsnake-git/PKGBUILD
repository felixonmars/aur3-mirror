# Maintainer: Alexandre Dantas <eu @ alexdantas DOT net>

pkgname=nsnake-git
pkgver=20140730
pkgrel=1
pkgdesc="Customizable Snake game with ncurses for the terminal - unstable development version"
arch=('x86_64' 'i686')
url="http://www.github.com/alexdantas/nsnake/"
license=('GPL3')
depends=('ncurses')
makedepends=('git')
conflicts=('nsnake')

source=("$pkgname::git+https://github.com/alexdantas/nsnake.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
#  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  git log -1 --date=short | grep 'Date:' | sed 's|[^0-9]||g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
