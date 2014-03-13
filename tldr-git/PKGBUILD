# Maintainer: David Kolossa david.kolossa@googlemail.com

pkgname=tldr-git
pkgver=r4.a19fc2d
pkgrel=1
pkgdesc="A Go client for tldr - git version"
arch=('x86_64' 'i686')
url="https://github.com/pranavraja/tldr"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
source=("$pkgname"::"git+https://github.com/pranavraja/tldr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  go build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/tldr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

