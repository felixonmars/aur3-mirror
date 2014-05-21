# Maintainer: Amr Hassan <amr.hassan@gmail.com>

pkgname=gopack
pkgver=0.12
pkgrel=1
pkgdesc="Dependency management for go inspired by rebar"
arch=('x86_64' 'i686')
url="https://github.com/d2fn/gopack"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
_go_dependencies=('github.com/pelletier/go-toml')
source=("https://github.com/d2fn/$pkgname/archive/$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"

  GOPATH="$srcdir" go get ${_go_dependencies[@]}
  GOPATH="$srcdir" go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
md5sums=('d7f85e896964047e2ecbb892f0ab43f9')
