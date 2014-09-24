# Maintainer: Maik Broemme <mbroemme@parallels.com>
pkgname=libct-git
pkgver=20140828.03ed4ee
pkgrel=1
pkgdesc="libct - a containers management library"
arch=("i686" "x86_64")
url="https://github.com/xemul/libct"
license=("LGPLv2")
depends=("protobuf-c")
makedepends=("asciidoc")
conflicts=("libct")
source=(
  "libct-git::git://github.com/xemul/libct.git"
)
sha256sums=(
  "SKIP"
)

pkgver() {
  cd "${srcdir}/libct-git"
  git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

build() {
  cd "${srcdir}/libct-git"
  export LDFLAGS="${LDFLAGS//-Wl,}"
  export CFLAGS="${CFLAGS} -I/usr/include/libnl3"
  make
  make docs
}

package() {
  cd "${srcdir}/libct-git"
  install -D -m 0644 Documentation/libct.1 "${pkgdir}/usr/share/man/man1/libct.1"
  install -D -m 0644 src/include/uapi/libct-errors.h "${pkgdir}/usr/include/libct/libct-errors.h"
  install -D -m 0644 src/include/uapi/libct.h "${pkgdir}/usr/include/libct/libct.h"
  install -D -m 0755 src/libct.so "${pkgdir}/usr/lib/libct.so.0.1.0"
  ln -s libct.so.0.1.0 "${pkgdir}/usr/lib/libct.so.0"
  ln -s libct.so.0.1.0 "${pkgdir}/usr/lib/libct.so"
}
