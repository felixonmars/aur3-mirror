# Maintainer: Colin Rice <colin@daedrum.net>
pkgname=hydrogend-git
pkgver=r92.aa67045
pkgrel=1
pkgdesc="A distributed system system"
arch=('x86_64')
url="https://github.com/c00w/hydrogen"
license=('GPL3')
makedepends=('go'
            'capnproto')
source=('hydrogend::git+https://github.com/c00w/hydrogen.git')
sha256sums=('SKIP')

build() {
  cd "$srcdir/hydrogend"
  make dependencies
  make
}

check() {
  cd "$srcdir/hydrogend"
  make test
}

package() {
  cd "$srcdir/hydrogend"
  install -Dm755 "$srcdir/hydrogend/bin/hydrogend" "$pkgdir/usr/bin/hydrogend"
}

pkgver() {
  cd "$srcdir/hydrogend"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
