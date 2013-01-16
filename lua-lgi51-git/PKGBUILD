#Based on lua-lgi from the AUR by speps and Sébastien Luttringer.
#Special thanks to l0gic for all his love, patience and his fix for this to work correctly
#Maintainer: TDKPS

pkgbase=lgi
pkgname=lua-lgi51-git
pkgver=20130113
pkgrel=1
pkgdesc="Lua bindings for gnome/gobject using gobject-introspection library"
arch=(i686 x86_64)
url='https://github.com/pavouk/lgi'
license=('custom:MIT')
depends=('glibc' 'glib2' 'libffi' 'lua51' 'gobject-introspection')
replaces=('lgi')
conflicts=('lgi','lua-lgi')
_gitroot="https://github.com/TDKPS/lgi.git"
_gitname=lgi


build() {
cd "$srcdir"

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build

  cd ${srcdir}/${_gitname}-build/
 
  make
}

package_lua-lgi() {
  cd ${srcdir}/${_gitname}-build/
  make \
    LUA_LIBDIR=/usr/lib/lua/5.1 \
    LUA_SHAREDIR=/usr/share/lua/5.1 \
    DESTDIR="$pkgdir/" install

  # dump typelib tool
  install -Dm755 tools/dump-typelib.lua \
    "$pkgdir/usr/bin/dump-typelib"

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