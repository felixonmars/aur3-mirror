# Maintainer: Your Name <youremail@domain.com>
pkgname=libcxxrt-git
_pkgname=${pkgname/-git/}
pkgver=4.0.10.r84.g4bc550a
pkgrel=1
pkgdesc="C++ Runtime from PathScale, FreeBSD and NetBSD"
arch=('i686' 'x86_64')
url="https://github.com/pathscale/libcxxrt"
license=('custom:BSD2')
depends=('libunwind')
makedepends=('git')
options=('staticlibs')
source=('git+https://github.com/pathscale/libcxxrt.git'
        'Makefile' #From Gentoo
        'Makefile.test')
sha512sums=('SKIP'
            'acb4b2855ea3912db0d3a26c7f8e7703b865f7e6f17b22a3654d9ac10633fc25fae3ba3995f0f33c106f4eba14ca897e8c6256e339e4d7f1393d8efdee7f4ef4'
            'fc93c26e4df1c5eca2f99ad3058e2d129fa85a876c9d3d6fcc9e456f397455ebd136b88b3c0ed8d27003dc7a00a985094b6c711fb34316d9fef39e1ab2aadaba')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Copy main Makefile
  cp "${srcdir}/Makefile" 'src/Makefile'

  # Copy test Makefile
  cp "${srcdir}/Makefile.test" 'test/Makefile'
}

build() {
  cd "$srcdir/$_pkgname/src"
  export LDFLAGS+=" -Wl,-z,defs"
  export CC=${CC-gcc}
  export CXX=${CXX-g++}
  export AR=${AR-ar}
  LIBS="-ldl -lunwind -lc" make shared
  make static
}

check() {
  cd "$srcdir/$_pkgname/test"
  LD_LIBRARY_PATH="${PWD}/../src:${LD_LIBRARY_PATH}" \
    LIBS="-L\"${PWD}/../src\" -lcxxrt -lunwind -ldl -lc" \
    make check
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -Dm755 'src/libcxxrt.so' "${pkgdir}/usr/lib/libcxxrt.so"
  install -Dm644 'src/libcxxrt.a' "${pkgdir}/usr/lib/libcxxrt.a"
  install -Dm644 'src/unwind.h' "${pkgdir}/usr/include/libcxxrt/unwind.h"
  install -Dm644 'src/unwind-arm.h' "${pkgdir}/usr/include/libcxxrt/unwind-arm.h"
  install -Dm644 'src/unwind-itanium.h' \
    "${pkgdir}/usr/include/libcxxrt/unwind-itanium.h"
  install -Dm644 'src/cxxabi.h' "${pkgdir}/usr/include/libcxxrt/cxxabi.h"
}
