pkgname=mujs-git
pkgver=0.0+333+b37173e
pkgrel=1
pkgdesc='Embeddable Javascript interpreter in C.'
arch=('i686' 'x86_64')
url="http://git.ghostscript.com/?p=mujs.git"
license=('AGPL')
provides=('mujs')
conflicts=('mujs')
makedepends=('clang' 'git')
options=('staticlibs')
source=('git://git.ghostscript.com/mujs.git')
sha256sums=('SKIP')

pkgver() {
  cd mujs
  printf "%s+%s+%s" "0.0" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd mujs
  make release
}

package() {
  cd mujs
  make prefix=/usr DESTDIR="$pkgdir" install
}
