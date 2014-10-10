# Maintainer: naxuroqa <naxuroqa@gmail.com>
pkgname=venom-git
pkgver=619.86f56e4
pkgrel=1
pkgdesc="A Vala/Gtk+ GUI for Tox"
arch=('i686' 'x86_64')
url="https://github.com/naxuroqa/Venom"
license=('GPL')
makedepends=('git' 'cmake' 'vala>=0.18.1')
depends=('gtk3>=3.4.1' 'sqlite>=3.7.9' 'json-glib>=0.14.2' 'qrencode>=3.1.1' 'libnotify>=0.7.3' 'tox-git>=r2833' 'hicolor-icon-theme' 'desktop-file-utils')
conflicts=('venom')
provides=('venom')
options=()
install=venom.install
source=("$pkgname"::'git+https://github.com/naxuroqa/Venom.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DENABLE_QR_ENCODE=ON \
        -DENABLE_LIBNOTIFY=ON \
        ..
  make
}

package() {
  cd "$srcdir/$pkgname"

  cd build
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
