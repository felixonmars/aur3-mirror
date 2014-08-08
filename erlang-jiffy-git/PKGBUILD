#Maintainer: Krzesimir Sarnecki <krzesimir.sarnecki@gmail.com>

pkgname=erlang-jiffy-git
pkgver=0.11.3.r0.g99867af
pkgrel=1
pkgdesc="JSON NIFs for Erlang"
arch=('i686' 'x86_64')
url="https://github.com/davisp/jiffy"
license=('MIT')
depends=('erlang')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/davisp/jiffy.git')
md5sums=('SKIP')

build() {
  cd "$pkgname"
  make || return 1
}

package(){
  mkdir -p "$pkgdir"/usr/lib/erlang/lib/jiffy/
  cp -R "$srcdir"/"$pkgname"/ebin "$pkgdir"/usr/lib/erlang/lib/jiffy/
  cp -R "$srcdir"/"$pkgname"/priv "$pkgdir"/usr/lib/erlang/lib/jiffy/
  cp -R "$srcdir"/"$pkgname"/src "$pkgdir"/usr/lib/erlang/lib/jiffy/
  cp -R "$srcdir"/"$pkgname"/c_src "$pkgdir"/usr/lib/erlang/lib/jiffy/
  if [ -e "$srcdir"/"$pkgname"/include ]
      then cp -R "$srcdir"/"$pkgname"/include "$pkgdir"/usr/lib/erlang/lib/jiffy/
  fi
}

pkgver() {
  cd "$pkgname"
  # Use the tag of the last commit
  git describe --long --tag | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

