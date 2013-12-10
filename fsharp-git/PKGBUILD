# Maintainer: Joris Putcuyps <Joris.Putcuyps at gmail dot com>
# Contributor: Nikolay Amiantov <nikoamia@gmail.com>

pkgname=fsharp-git
pkgver=3.0.31.6.g48f6037
pkgrel=1
pkgdesc="An ML based functional language integrated with the .NET platform."
arch=('any')
url="http://fsharp.org"
license=('Apache')
depends=('mono>=3.0')
makedepends=('git')
options=('!strip')
source=('git+https://github.com/fsharp/fsharp.git')
sha1sums=('SKIP')

pkgver() {
  cd fsharp
  local ver="$(git describe --long --tags)"
  printf "%s" "${ver//-/.}"
}

build() {
  cd fsharp
  ./autogen.sh --prefix="/usr"
  make -j1
}

package() {
  cd fsharp
  make DESTDIR="$pkgdir" install
  cd "$pkgdir"
}
