# Contributor: Daemon Lee Schmidt <DaemonLeeSchmidt@gmail.com>

pkgname=c11threads-git
pkgver=20141226
pkgrel=2
pkgdesc="A temporary, pure header implementation of C11 threads."
arch=('any')
url="https://github.com/jtsiomb/c11threads"
license=('custom:Public Domain')
makedepends=('git')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=('git+https://github.com/jtsiomb/c11threads.git')
sha512sums=('SKIP')

prepare() {
  cd "${pkgname%-*}"

  cat c11threads.h | sed 's/C11THREADS_H_/_THREADS_H/' > threads.h


}

package() {
  cd "${pkgname%-*}"

  install -D -m644 "README" "${pkgdir}/usr/share/licenses/${pkgbase}/README"

  install -D -m644 "threads.h" "${pkgdir}/usr/include/threads.h"
}

# vim: ts=2 sw=2 et:
