# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgname=sterm-git
pkgver=r46.dd80bc0
pkgrel=1
pkgdesc="Simple and minimalistic terminal emulator based on VTE-2.90."
arch=(i686 x86_64)
url="http://git.shadowice.org/sterm.git/"
license="GPL3"
depends=('glib2' 'gtk3' 'vte3>=0.36.0')
makedepends=('cmake' 'git')

source=('git://shadowice.org/sterm.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/sterm"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  [[ -d "${srcdir}/build" ]] && rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"

  cd "${srcdir}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr ../sterm

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install
}
