# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Kenny Rasschaert <kenny dot rasschaert at gmail dot com> PGP-Key: 1F70454121E41419

pkgname=rocket
pkgver=0.5.3
pkgrel=1
pkgdesc="App container runtime"
arch=('x86_64')
url="https://github.com/coreos/rocket"
license=(apache)
makedepends=('cpio' 'go' 'squashfs-tools')
provides=('rocket')
source=("https://github.com/coreos/rocket/archive/v${pkgver}.tar.gz")
sha1sums=('1a1f68091340e94d0ac2f80b8fb7dd6115191b99')

build() {
  cd "rkt-${pkgver}"
  RKT_STAGE1_IMAGE=/usr/share/rkt/stage1.aci ./build
}

package() {
  cd "rkt-${pkgver}"
  install -Dm755 bin/rkt "$pkgdir/usr/bin/rkt"
  install -Dm644 bin/stage1.aci "$pkgdir/usr/share/rkt/stage1.aci"
}

# vim:set ts=2 sw=2 et:
