
pkgname=configurable-http-proxy
pkgver=0.2.1
pkgrel=1
pkgdesc="node-http-proxy plus a REST API"
url="https://github.com/jupyter/configurable-http-proxy"
arch=(any)
license=('BSD')
depends=('nodejs')
source=("https://github.com/jupyter/configurable-http-proxy/archive/${pkgver}.tar.gz")
md5sums=('3112133b6b262eaf0f1cb8c99ca9db12')
_npmname=configurable-http-proxy

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  rm -rf "$pkgdir/usr/etc"
  chown -R root:root "$pkgdir/usr"
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 COPYING.md "${pkgdir}"/usr/share/licenses/$pkgname/COPYING.md
}

