# Maintainer: Adrian Smith <triode1@btinternet.com>
pkgname=turbolua
pkgver=1.0.0
pkgrel=1
pkgdesc='Turbo.lua web framework'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://turbolua.org"
license=('Apache')
depends=('luajit')
provides=('turbolua')
source=("https://github.com/kernelsauce/turbo/archive/v${pkgver}.tar.gz")
sha256sums=('d4d0b8b000af543ff1d753380d309a6e5bad327fd04a972c221dc097d319b272')

build() {
  cd "turbo-$pkgver"

  make PREFIX="/usr"
}

package() {
  cd "turbo-$pkgver"

  make PREFIX="$pkgdir/usr/" install
}
