# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=nodejs-blessed
_npmname=${pkgname#nodejs-}
pkgver=0.0.35
pkgrel=1
pkgdesc="A curses-like library for node.js"
arch=(any)
url="https://github.com/chjj/blessed"
license=('MIT')
depends=('nodejs')
source=(${_npmname}-${pkgver}.tar.gz::"https://github.com/chjj/${_npmname}/archive/v${pkgver}.tar.gz")
noextract=(${_npmname}-${pkgver}.tar.gz)
md5sums=('2e3e64196277bef957aabc1064f4fa12')

package() {
  npm install --user root -g --prefix "$pkgdir/usr" --no-bin-links ${_npmname}-${pkgver}.tar.gz

  # Copy licence to standard location
  install -D -m644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
