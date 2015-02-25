# Maintainer: G. Richard Bellamy <rbellamy@pteradigm.com>

_pkgver=0.5

pkgname=numad-git
pkgver=0.5.r18.g18cfb06
pkgrel=5

pkgdesc="A user-level Deamon that monitors NUMA topology and usage and distributes loads for good locality for the purpose of providing the best performance, by avoiding unnecessary latency."

arch=('i686' 'x86_64')
url="https://git.fedorahosted.org/cgit/numad.git/"
license=('LGPL2')

makedepends=('git')

provides=('numad')
conflicts=('numad')

source=("${pkgname}::git://git.fedorahosted.org/git/${pkgname/-/.}")

sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  echo "${_pkgver}.r$(git rev-list --count master).g$(git log -1 --format="%h")"
}

build() {
  cd "${pkgname}"

  make CFLAGS="${CFLAGS} -std=gnu99" LDFLAGS="${LDFLAGS} -lpthread -lrt -lm"
}

package() {
  cd "${pkgname}"

  make install prefix="${pkgdir}/usr"
  install -Dm644 numad.service "${pkgdir}/usr/lib/systemd/system/numad.service"
  install -Dm644 numad.logrotate "${pkgdir}/etc/logrotate.d/numad"
}

# vim:set ts=2 sw=2 et:
