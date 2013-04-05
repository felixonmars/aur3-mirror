# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=libcofi_rpi-git
pkgver=0.13.7313fbe
pkgrel=1
pkgdesc="Optimised memcpy/memset implementation for ARM11 used in Raspberry Pi"
arch=('armv6h')
url="https://github.com/simonjhall/copies-and-fills"
license=('GPL2.1')
makedepends=('git')
source=('libcofi::git://github.com/simonjhall/copies-and-fills.git'
        'libcofi_rpi.sh')
md5sums=('SKIP'
         '696850608bbd68709a1e22ef28871b3a')

pkgver() {
  cd "${srcdir}/libcofi"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "${srcdir}/libcofi"

  make
}

package() {
  cd "${srcdir}/libcofi"

  mkdir -p "${pkgdir}/"{etc/profile.d,usr/lib}

  cp libcofi_rpi.so "${pkgdir}/usr/lib/"
  cp ../libcofi_rpi.sh "${pkgdir}/etc/profile.d/"
  chmod +x "${pkgdir}/etc/profile.d/libcofi_rpi.sh"
}

