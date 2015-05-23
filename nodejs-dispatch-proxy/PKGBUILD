# Maintainer: Daemon Lee Schmidt <DaemonLeeSchmidt@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-dispatch-proxy
_npmname=dispatch-proxy
pkgver=0.1.3
pkgrel=2
pkgdesc="A SOCKS5/HTTP proxy that balances traffic between multiple internet connections"
arch=('any')
url="https://github.com/Morhaus/dispatch-proxy"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('d79c6c11ef3e4fad4ac7488f462e85b77f36d697426f55e6a1c0bcf14945185f')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}


