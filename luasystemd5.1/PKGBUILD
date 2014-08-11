# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=luasystemd5.1
pkgver="scm_0"
pkgrel=2
pkgdesc="Lua bindings to systemd"
arch=('i686' 'x86_64')
url="http://github.com/daurnimator/lua-systemd"
license=('MIT')
depends=('lua51')
makedepends=('luarocks5.1')
source=("http://rocks.moonscript.org/manifests/daurnimator/systemd-${pkgver/_/-}.src.rock")

package() {
  luarocks-5.1 --to="$pkgdir/usr" install --deps-mode=none "$srcdir/systemd-${pkgver/_/-}.src.rock"
  rm -Rf "$pkgdir/usr/lib/luarocks"
}

sha256sums=('3d118b1aea0132261726bc52a46aea29b833574e703a5902d79631ae82a334f4')
