# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luasocket2-hg
pkgver=20
pkgrel=1
pkgdesc="Luasocket is the most comprehensive networking support library for the Lua language, with IPv6 support."
arch=('i686' 'x86_64')
url="http://code.matthewwild.co.uk/luasocket2-hg"
license=('MIT')

depends=(lua)
makedepends=(mercurial)
conflicts=(luasocket)
provides=('luasocket=2.0.3')

source=(lua-license.html::http://www.lua.org/copyright.html
	luasocket-arch.patch
	luasocket-unixsocket.patch)
md5sums=('516933a6a057fd6edf5e27c12f3f4f85'
	 'c98b6a116929d0e4665df2ffd28802a6'
	 'fd094b319c3099e09384b15d8127a066')

_hgroot=http://code.matthewwild.co.uk
_hgrepo=$pkgname

build() {
  cd "$srcdir"
  rm -rf "$_hgrepo-build"
  hg clone "$_hgrepo" "$_hgrepo-build"

  cd "$_hgrepo-build"
  patch -p0 < "$srcdir/luasocket-arch.patch"
  patch -p0 < "$srcdir/luasocket-unixsocket.patch"

  make linux
}

package() {
  cd "$srcdir/$_hgrepo-build"

  make DESTDIR="$pkgdir" install

  install -D -m0644 "$srcdir/lua-license.html" "$pkgdir/usr/share/licenses/$pkgname/lua-license.html"
}
