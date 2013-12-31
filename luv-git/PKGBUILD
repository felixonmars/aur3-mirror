# Maintainer: iv597 <j@iv597.com>

_pkgname=luv
pkgname=luv-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Bare libuv bindings for lua"
arch=('i686' 'x86_64')
url="https://github.com/creationix/luv"
license=('unknown')
depends=('lua51')
optdepends=('luajit: optimized performance')
makedepends=('git')
conflicts=('luv')
provides=('luv')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git+https://github.com/creationix/luv.git'
        'git+https://github.com/joyent/libuv.git'
        'Makefile.patch')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP'
        'SKIP'
        '03cbe8172b9a554acd8c8091e9ee6bc3')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.libuv.url $srcdir/libuv
	git submodule update
	patch -N -i "$srcdir/Makefile.patch"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 644 luv.so "$pkgdir/usr/lib/lua/5.1/luv.so"
}
