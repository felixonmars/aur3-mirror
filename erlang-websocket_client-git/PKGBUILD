#Maintainer: Krzesimir Sarnecki <krzesimir.sarnecki@gmail.com>

pkgname=erlang-websocket_client-git
pkgver=v0.6.1.r2.g2b8d980
pkgrel=1
pkgdesc="Erlang websocket client (ws and wss supported)"
arch=('i686' 'x86_64')
url="https://github.com/jeremyong/websocket_client"
license=('MIT')
depends=('erlang')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/jeremyong/websocket_client.git')
md5sums=('SKIP')

build() {
  cd "$pkgname"
  make || return 1
}

package(){
  mkdir -p "$pkgdir"/usr/lib/erlang/lib/websocket_client/
  cp -R "$srcdir"/"$pkgname"/ebin "$pkgdir"/usr/lib/erlang/lib/websocket_client/
  cp -R "$srcdir"/"$pkgname"/src "$pkgdir"/usr/lib/erlang/lib/websocket_client/
  cp -R "$srcdir"/"$pkgname"/examples "$pkgdir"/usr/lib/erlang/lib/websocket_client/
  if [ -e "$srcdir"/"$pkgname"/include ]
      then cp -R "$srcdir"/"$pkgname"/include "$pkgdir"/usr/lib/erlang/lib/websocket_client/
  fi
}

pkgver() {
  cd "$pkgname"
  # Use the tag of the last commit
  git describe --long --tag | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

