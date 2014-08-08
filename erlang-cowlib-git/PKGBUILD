#Maintainer: Krzesimir Sarnecki <krzesimir.sarnecki@gmail.com>

pkgname=erlang-cowlib-git
pkgver=1.0.0.r0.gd544a49
pkgrel=1
pkgdesc="Support library for manipulating Web protocols."
arch=('i686' 'x86_64')
url="https://github.com/ninenines/cowlib"
license=('ISC')
depends=('erlang')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/ninenines/cowlib.git')
md5sums=('SKIP')

build() {
  cd "$pkgname"
  make || return 1
}

package() {
  mkdir -p "$pkgdir"/usr/lib/erlang/lib/cowlib/
  cp -R "$srcdir"/"$pkgname"/ebin "$pkgdir"/usr/lib/erlang/lib/cowlib/
  cp -R "$srcdir"/"$pkgname"/src "$pkgdir"/usr/lib/erlang/lib/cowlib/
  cp -R "$srcdir"/"$pkgname"/include "$pkgdir"/usr/lib/erlang/lib/cowlib/
}

pkgver() {
  cd "$pkgname"
  # Use the tag of the last commit
  git describe --long --tag | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

