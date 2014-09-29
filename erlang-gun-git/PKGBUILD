#Maintainer: Krzesimir Sarnecki <krzesimir.sarnecki@gmail.com>

pkgname=erlang-gun-git
pkgver=0.1
pkgrel=1
pkgdesc="Asynchronous SPDY, HTTP and Websocket client written in Erlang."
arch=('i686' 'x86_64')
url="https://github.com/extend/gun"
license=()
depends=('erlang')
makedepends=('git' 'erlang-ranch-git' 'erlang-cowlib-git')
source=("$pkgname"::'git+https://github.com/extend/gun.git')
md5sums=('SKIP')

build() {
  cd "$pkgname"
  make || return 1
}

package(){
  mkdir -p "$pkgdir"/usr/lib/erlang/lib/gun/
  cp -R "$srcdir"/"$pkgname"/ebin "$pkgdir"/usr/lib/erlang/lib/gun/
  cp -R "$srcdir"/"$pkgname"/src "$pkgdir"/usr/lib/erlang/lib/gun/
  if [ -e "$srcdir"/"$pkgname"/include ]
      then cp -R "$srcdir"/"$pkgname"/include "$pkgdir"/usr/lib/erlang/lib/gun/
  fi
}

pkgver() {
  cd "$pkgname"
  # Use the tag of the last commit
  git describe --long --tag | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

