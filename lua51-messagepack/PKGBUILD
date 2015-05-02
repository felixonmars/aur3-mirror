# Maintainer: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>

pkgname=lua51-messagepack
pkgver=0.3.2
pkgrel=2
pkgdesc='A pure Lua implementation of MessagePack v5.'
arch=('any')
url='https://fperrad.github.io/lua-MessagePack'
license=('MIT')
source=("https://github.com/fperrad/lua-MessagePack/archive/${pkgver}.tar.gz")
sha256sums=('6580961958dd43455f7f74708514011e0aadf442167869fb60c53b018f041eac')
conflicts=('lua-messagepack') # lua-messagepack currently installs for 5.1 as well

package() {
  cd "lua-MessagePack-${pkgver}"
  make LUAVER=5.1 PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
