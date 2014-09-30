# Maintainer: speps <speps at aur dot archlinux dot org>
# Maintainer: Sébastien Luttringer
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

pkgbase=lgi
pkgname=lua51-lgi
pkgver=0.8.0
pkgrel=2
pkgdesc='Lua bindings for gnome/gobject using gobject-introspection library'
arch=(i686 x86_64)
url='https://github.com/pavouk/lgi'
license=('custom:MIT')
depends=('glibc' 'glib2' 'libffi' 'lua51' 'gobject-introspection')
replaces=('lgi')
conflicts=('lgi')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/pavouk/$pkgbase/archive/$pkgver.tar.gz")
md5sums=('f0a161fc07b65afabdd09aa5455390a3')

prepare () {
  cd $pkgbase-$pkgver
  sed -i -e 's/-llua/-llua5.1/' lgi/Makefile
}

build() {
  cd $pkgbase-$pkgver
  make LUA_VERSION=5.1 LUA_CFLAGS="$(pkg-config lua5.1 --cflags)"
}

package_lua51-lgi() {
  cd $pkgbase-$pkgver
  make \
    LUA_VERSION=5.1 \
    LUA_LIBDIR=/usr/lib/lua/5.1 \
    LUA_SHAREDIR=/usr/share/lua/5.1 \
    DESTDIR="$pkgdir/" install

  # dump typelib tool
  install -Dm755 tools/dump-typelib.lua \
    "$pkgdir/usr/bin/dump-typelib-lua51"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/* \
    "$pkgdir/usr/share/doc/$pkgname"

  # samples
  install -d "$pkgdir/usr/share/$pkgname/samples/gtk-demo"
  install -Dm644 samples/*.lua \
    "$pkgdir/usr/share/$pkgname/samples"
  install -Dm644 samples/gtk-demo/* \
    "$pkgdir/usr/share/$pkgname/samples/gtk-demo"

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
