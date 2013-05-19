# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=alien
pkgver=0.5.0
pkgrel=2
pkgdesc="Foreign Function Interface (FFI) for Lua 5.1"
arch=('i686' 'x86_64')
url="http://alien.luaforge.net/"
license=('custom:MIT')
depends=('lua51' 'libffi')
source=("$url$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch" "license")
md5sums=('d6b265798f6d610d4651d054f601d468'
         'd321f9db5dcbc106957f54db27fba78c'
         'f8b2318fe5de94dd343a0cdf757d9334')

prepare() {
  patch -p0 -i "$srcdir/${source[1]}"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -f Makefile.$pkgname
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make -f Makefile.$pkgname DESTDIR="$pkgdir/" install

  # license
  install -Dm644 ../license \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
