pkgname=libmseed
pkgver=2.11
pkgrel=1
pkgdesc="A C library framework for manipulating and managing SEED data records."
arch=('i686' 'x86_64')
url="http://www.iris.edu/software/libraries/"
license=('LGPL')
depends=('glibc')
source=(https://seiscode.iris.washington.edu/attachments/download/348/$pkgname-$pkgver.tar.gz)
md5sums=('1ab116e0f939afb71d7de403456f05a5')
sha256sums=('999a099ef067e5a1e1cc07e7122192cdfb5b37b123b9a951a9a30cfeea535dfb')

build() {
  cd "$srcdir/$pkgname"
  make static
  make shared
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 ${pkgname}.so.${pkgver} "${pkgdir}/usr/lib/${pkgname}.so.${pkgver}"
  ln -s /usr/lib/${pkgname}.so.${pkgver} "${pkgdir}/usr/lib/${pkgname}.so"
  install -Dm644 ${pkgname}.a "${pkgdir}/usr/include/${pkgname}.a"
  install -Dm644 ${pkgname}.h "${pkgdir}/usr/include/${pkgname}.h"
  install -Dm644 lmplatform.h "${pkgdir}/usr/include/lmplatform.h"
  install -dm755 "${pkgdir}/usr/share/man/man3/"
  install -Dm644 -t "${pkgdir}/usr/share/man/man3/" doc/ms*.3
}

# vim:set ts=2 sw=2 et:
