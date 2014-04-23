# Maintainer: Jean-Philippe Gagné Guay <jeanphilippe150 at gmail dot com>

_gitname=servman
pkgname=servman-git
pkgver=r9.a13bbc5
pkgrel=1
pkgdesc="A simple service manager (including an rc script)"
url="https://github.com/ggjp/servman"
arch=('any')
license=('GPL3')
depends=('sh')
makedepends=('git')
optdepends=('sinit: for init'
            'ubase: for halt, killall5, getty and respawn')
source=('git+https://github.com/ggjp/servman.git')
sha256sums=('SKIP')
backup=('etc/init.d/rc')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/bin"
  cp -R etc/ "$pkgdir"
  mkdir -p "$pkgdir/etc/init.d/running/net"
  cp bin/servman "$pkgdir/usr/bin/"
}
