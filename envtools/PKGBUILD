# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=envtools
pkgver=r8.10484a9
pkgrel=1
pkgdesc="Utilities to manipulate spherical images"
url="https://github.com/rlk/envtools"
license=('MIT')
arch=('any')
makedepends=(git make gcc libtiff libjpeg-turbo libpng zlib)
provides=('envremap' 'envtoirr')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/bin"
  install -m755 ${provides[@]} "${pkgdir}/usr/bin"

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
