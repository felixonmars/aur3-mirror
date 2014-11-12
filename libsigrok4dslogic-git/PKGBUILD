# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok4dslogic-git
pkgver=34.7c8b0b1
pkgrel=2
pkgdesc="Client software that supports the DSLogic DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('libzip' 'libserialport' 'libusb')
makedepends=('boost')
conflicts=('libsigrok4dslogic')
source=("git+https://github.com/DreamSourceLab/DSLogic.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/DSLogic"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/DSLogic/libsigrok4DSLogic"

  ./autogen.sh
  ./configure --prefix=/usr --exec-prefix=/usr
  make
}

package() {
  cd "$srcdir/DSLogic/libsigrok4DSLogic"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
