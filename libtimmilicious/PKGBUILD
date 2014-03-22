# Maintainer: Tim Hütz <tim[at]huetz[dot]biz>
pkgname=libtimmilicious
pkgver=1.1.0
pkgrel=1
pkgdesc=""
url="https://github.com/thuetz/libtimmilicious"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('boost-libs')
optdepends=()
makedepends=('cmake' 'boost')
conflicts=()
replaces=()
backup=()
install='libtimmilicious.install'
source=("https://github.com/thuetz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('cb3a836e3d0d3bf00d872f83a7368d13a180018a9899c87b6135b8b58da32c87')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
