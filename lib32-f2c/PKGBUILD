# Maintainer: Jesin <jesin00@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Gabriele Lanaro <gabriele.lanaro@gmail.com>

pkgname=lib32-f2c
pkgnameorig=f2c
pkgver=1.0
pkgrel=6
pkgdesc='Fortran to C code translator'
url='http://www.netlib.org/f2c/index.html'
license=('custom')
arch=('x86_64')
source=("http://computation.llnl.gov/casc/Overture/henshaw/software/${pkgnameorig}.tar.gz"
    "patch")
sha256sums=('5cac8440ebfaf0958296044219935bfcf5d0bff318fe2e4f9ac0290007fb73c8'
    "5b25d9ae95577e43ee3ec670d001830a56637973e950c120286c25110ba20ab4")
options=(staticlibs)

build() {
  patch  "${srcdir}/${pkgnameorig}"/libf2c/makefile < ../patch
  cd "${srcdir}/${pkgnameorig}"
  export CFLAGS="-m32"
  export LDFLAGS="-m32 -L/usr/lib32"
  make -C src CFLAGS="-O ${CFLAGS} -fPIC"
  make -C libf2c CFLAGS="-O ${CFLAGS} -fPIC"

  cd libf2c

  gcc ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -m32 \
    -shared -Wl,-soname,libf2c.so.2 -o libf2c.so.2 *.o -lc
}

package() {
  cd "${srcdir}/${pkgnameorig}"

  install -Dm755 src/f2c "${pkgdir}/usr/bin/f2c"
  #make -C libf2c LIBDIR="${pkgdir}/usr/lib32" install
  install -Dm644 libf2c/libf2c.a "${pkgdir}/usr/lib32/libf2c.a"
  install -Dm644 libf2c/f2c.h "${pkgdir}/usr/include/f2c.h"
  install -Dm644 libf2c/libf2c.so.2 "${pkgdir}/usr/lib32/libf2c.so.2"
  install -Dm644 src/f2c.1t "${pkgdir}/usr/share/man/man1/f2c.1"
  install -Dm644 src/Notice "${pkgdir}/usr/share/licenses/f2c/LICENSE"
} 

# vim:set ts=2 sw=2 et:
