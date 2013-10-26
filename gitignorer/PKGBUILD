# Maintainer: Zach Latta <zach@zachlatta.com>

pkgname=gitignorer
pkgver=1.0.0
pkgrel=1
pkgdesc="Gitignorer is the easiest way to create .gitignore files."
arch=('x86_64' 'i686')
url="https://github.com/zachlatta/gitignorer"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/zachlatta/gitignorer/archive/v1.0.0.tar.gz")
sha256sums=('55bf825f9c9ac03644b4c906bbc210c843b971cf4c486d715b08dc5bbde5ee59')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
