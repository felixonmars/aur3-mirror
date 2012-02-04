# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Lucas Hermann Negri <lucashnegri@gmail.com>

_pkg=lgob
pkgname=$_pkg-git
pkgver=20111019
pkgrel=1
pkgdesc="A set of bindings of GObject-based libraries, like GTK+ and WebKitGtk, and some others like Cairo, for Lua."
arch=(i686 x86_64)
url="http://oproj.tuxfamily.org" 
depends=('lua>=5.1' 'libwebkit3' 'gtksourceview3' 'clutter-gtk' 'vte3')
license=('LGPL')
provides=("$_pkg")
conflicts=("$_pkg")

_gitroot=http://git.gitorious.org/lgob/mainline.git
_gitname=$_pkg

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

  # enable 64 bit build
  [ "$CARCH" = 'x86_64' ] && _opt=AMD64
}

package() {
  cd "$srcdir/$_gitname-build"

  lua build_all.lua "$pkgdir/usr" $_opt

  # examples
  install -d "$pkgdir/usr/share/$_pkg/examples"
  install -Dm644 examples/* "$pkgdir/usr/share/$_pkg/examples"
}