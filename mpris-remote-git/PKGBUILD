# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=mpris-remote-git
pkgver=r51.9d401bf
pkgrel=1
pkgdesc='Command line tool for interacting with music players that support the mpris spec'
arch=('any')
url='http://incise.org/mpris-remote.html'
license=('unknown')
depends=('python2')
makedepends=('git')
source=('git+https://github.com/mackstann/mpris-remote.git')
sha512sums=('SKIP')

pkgver() {
  cd "mpris-remote"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "mpris-remote"
  sed -i "1s/python/python2/" mpris-remote
}

package() {
  cd "mpris-remote"
  install -D -m755 "mpris-remote" "${pkgdir}/usr/bin/mpris-remote"
}
