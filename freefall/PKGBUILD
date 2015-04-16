# Maintainer: Neven Sajko <nsajko/at/gmail dot com>

pkgname=freefall
pkgver=3.d74aae4e
pkgrel=2
pkgdesc='Disk protection for HP/DELL machines.'
url=https://github.com/torvalds/linux/blob/master/Documentation/laptops/freefall.c
license=(GPL2)
source=(https://raw.githubusercontent.com/torvalds/linux/d74aae4ea0257f3d6e94ef7a0420ef5074d6eb1e/Documentation/laptops/freefall.c
        freefall@.service)
sha256sums=(6fad3e93be9fdb5fbf87ced466961d0c3190614bf5e8efdb0fa20071f4dc06ba
            142cad79413725b9ec3f8182ed688f8e98ec98de18085e9ddd92d059a43713bd)
arch=(i686 x86_64)
depends=(glibc)
replaces=(hpfall hpfall-git)

build() {
  gcc -Os -o freefall freefall.c
}
package() {
  install -Dm0755 freefall "$pkgdir/usr/bin/freefall"
  install -Dm0644 freefall@.service "$pkgdir/usr/lib/systemd/system/freefall@.service"
}
