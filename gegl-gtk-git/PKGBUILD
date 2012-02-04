# Maintainer: Jon Nordby <jononor@gmail.com>

_pkgname=gegl-gtk
pkgname=$_pkgname-git
pkgver=20110721
pkgrel=1
pkgdesc="Convenience library for using GEGL in Gtk+ applications" 
arch=(i686 x86_64)
url="http://www.gegl.org"
license=('LGPLv3+')
depends=('gegl' 'gtk2')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://git.gnome.org/gegl-gtk"
_gitname="gegl-gtk"

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

  # BUILD
  # Introspection requires gegl from git
  ./autogen.sh --prefix=/usr --disable-introspection
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
