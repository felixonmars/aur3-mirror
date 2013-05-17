# Maintainer: speps <speps at aur dot archlinux dot org>

_name=lua-lgi
pkgname=$_name-git
pkgver=0.7.1.9.gbd61a50
pkgrel=1
pkgdesc="Lua binadings for gnome/gobject using gobject-introspection library."
arch=(i686 x86_64)
url="https://github.com/pavouk/lgi"
license=('custom:MIT')
depends=('lua' 'gobject-introspection')
makedepends=('git')
optdepends=('clidebugger: dump-typelib tool')
provides=('lgi' 'lua-lgi' 'lgi-git')
conflicts=('lgi' 'lua-lgi' 'lgi-git')
replaces=('lgi-git')
source=("$pkgname::git+https://github.com/pavouk/lgi.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"

  make PREFIX=/usr \
       LUA_LIBDIR=/usr/lib/lua/5.2 \
       LUA_SHAREDIR=/usr/share/lua/5.2 \
       DESTDIR="$pkgdir/" install

  # dump typelib tool
  install -Dm755 tools/dump-typelib.lua \
    "$pkgdir/usr/bin/dump-typelib"

  # docs
  install -d "$pkgdir/usr/share/doc/$_name"
  install -Dm644 docs/* \
    "$pkgdir/usr/share/doc/$_name"

  # samples
  install -d "$pkgdir/usr/share/$_name/samples/gtk-demo"
  install -Dm644 samples/*.lua \
    "$pkgdir/usr/share/$_name/samples"
  install -Dm644 samples/gtk-demo/* \
    "$pkgdir/usr/share/$_name/samples/gtk-demo"

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
