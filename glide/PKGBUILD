# Maintainer: Andrius Sutas <aur [dot] archlinux [dot] org [at] motoko [dot] sutas [dot] eu>

pkgname=glide
pkgver=0.2.0
pkgrel=1
pkgdesc="A simplified manager for Go projects, dependencies, and vendoring"
arch=('i686' 'x86_64')
url="https://github.com/Masterminds/glide"
license=('MIT')
makedepends=('git' 'go')
provides=('glide')
source=('git+https://github.com/Masterminds/glide.git')
sha256sums=('SKIP')

package() {
  cd "$pkgname"
  
  git checkout $pkgver
  make bootstrap

  install -D -m 755 ./glide "$pkgdir/usr/bin/glide"
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
