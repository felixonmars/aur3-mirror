# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=lgi-git
pkgver=20120606
pkgrel=1
pkgdesc="Lua binadings for gnome/gobject using gobject-introspection library."
arch=(i686 x86_64)
url="https://github.com/pavouk/lgi"
license=('custom:MIT')
depends=('lua' 'gobject-introspection')
makedepends=('git')
optdepends=('clidebugger: dump-typelib tool')
provides=('lgi')
conflicts=('lgi')

_gitroot="https://github.com/pavouk/lgi.git"
_gitname="lgi"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname-build"

  make PREFIX=/usr DESTDIR="$pkgdir/" install

  # dump typelib tool
  install -Dm755 tools/dump-typelib.lua \
    "$pkgdir/usr/bin/dump-typelib"

  # docs
  install -d "$pkgdir/usr/share/doc/lgi"
  install -Dm644 docs/* \
    "$pkgdir/usr/share/doc/lgi"

  # samples
  install -d "$pkgdir/usr/share/lgi/samples/gtk-demo"
  install -Dm644 samples/*.lua \
    "$pkgdir/usr/share/lgi/samples"
  install -Dm644 samples/gtk-demo/* \
    "$pkgdir/usr/share/lgi/samples/gtk-demo"

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
