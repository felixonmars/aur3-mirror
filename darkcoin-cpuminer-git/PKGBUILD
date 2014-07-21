# Your name here?

pkgname=darkcoin-cpuminer-git
_gitname=darkcoin-cpuminer
pkgver=1.34d743e
pkgrel=1
pkgdesc="Multi-threaded CPU miner for Darkcoin. SSE2 instruction set. 
X11 algo, 64bit only. (git version)"
arch=('x86_64')
url="https://github.com/ig0tik3d/darkcoin-cpuminer-1.2c"
license=('GPL2')
depends=('curl>=7.34.0' 'jansson')
makedepends=('git' 'autoconf' 'automake' 'yasm')
source=('cpuminer::git+https://github.com/ig0tik3d/darkcoin-cpuminer-1.2c.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"
	cd "../cpuminer"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/cpuminer"
  # Use in-tree jansson
  # sed -e 's/^AC_CHECK_LIB(jansson, json_loads, request_jansson=false, request_jansson=true)$/request_jansson=true/' -i configure.ac

  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/cpuminer"

  make DESTDIR="$pkgdir/" install
  install -Dm755 "minerd" "$pkgdir/usr/bin/darkcoin-minerd"
  rm "$pkgdir/usr/bin/minerd"
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

