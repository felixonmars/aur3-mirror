# Maintainer: Paul Burton <paulburton89@gmail.com>
pkgname=('ci20-tools-git' 'libci20-git')
pkgver=r10.060fb1e
pkgrel=1
pkgdesc="A set of tools for controlling MIPS Creator CI20 boards using USB"
arch=('i686' 'x86_64')
url="https://github.com/paulburton/ci20-tools"
license=('GPL')
makedepends=('cross-mipsel-linux-gnu-gcc' 'git' 'libusb')
source=('git+https://github.com/paulburton/ci20-tools.git'
        '60-jz4780.rules')
sha256sums=('SKIP'
            'c339739cbe0204e72766e6a01594443dbe3c2e0a4e9ea3701b9856e1948ec643')

pkgver() {
  cd "ci20-tools"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/ci20-tools"
  make CROSS_COMPILE=mipsel-linux-gnu-
}

package_ci20-tools-git() {
  depends=('libci20')
  provides=('ci20-tools')
  conflicts=('ci20-tools')

  cd "${srcdir}/ci20-tools"
  make install-tools DESTDIR="${pkgdir}/usr"
}

package_libci20-git() {
  depends=('libusb')
  provides=('libci20')
  conflicts=('libci20')

  cd "${srcdir}/ci20-tools"
  make install-lib DESTDIR="${pkgdir}/usr"

  install -Dm644 "${srcdir}/60-jz4780.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/60-jz4780.rules"
}
