# Contributor: BoySka <boyska@gmail.com>
# Maintainer: BoySka <boyska@gmail.com>

pkgname=dmenu-path-c
pkgver=0.1
pkgrel=3
pkgdesc="dmenu_path C rewrite. 2-4x faster on cache hits, 10-20x faster on cache misses"
arch=('i686' 'x86_64')
url="http://tools.suckless.org/dmenu/patches/dmenu_path"
license=('MIT')
source=('http://tools.suckless.org/dmenu/patches/legacy/dmenu_path.c' MIT_license.txt)
md5sums=('50f778cb4f99963d74e9a0f5efd58f70'
         '995598bc9de2b4c987c2cb87fc24f341')
sha256sums=('a593a43046843effd208247e136bfa6b1c5088228c9bbca1d397823815d82d62'
  '91276db973f25602d1aa43491f59cbc84cb88e6f151e1d0cc82a755563ce0195')
depends=('glibc')

build() {
  cd "$srcdir/" #$pkgname-$pkgver"

  gcc $CFLAGS dmenu_path.c -o dmenu_path_c
}
package() {
  install dmenu_path_c -D "$pkgdir/usr/bin/dmenu_path_c"
  install MIT_license.txt -D "$pkgdir/usr/share/licenses/dmenu-path-c/LICENSE"
}

# vim:set ts=2 sw=2 et:
