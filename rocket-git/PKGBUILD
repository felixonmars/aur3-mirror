# Maintainer: Boohbah <boohbah at gmail dot com>
# Contributor: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0

pkgname=rocket-git
pkgver=0.1.0.r77.g553023e
pkgrel=1
pkgdesc="App container runtime (git version)"
arch=('x86_64')
url="https://github.com/coreos/rocket"
license=('Apache')
makedepends=('cpio' 'go' 'go-bindata-git' 'squashfs-tools')
provides=('rocket')
conflicts=('rocket')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  ./build
}

package() {
  cd "$pkgname"
  install -Dm755 bin/rkt "$pkgdir/usr/bin/rkt"
}

# vim:set sts=2 sw=2 et:
