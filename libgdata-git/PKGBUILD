# Maintainer: Yosef Or Boczko <yosefor3@walla.com>

_pkgname=libgdata
pkgname=$_pkgname-git
pkgver=20130320
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsoup-gnome' 'liboauth' 'gcr' 'gnome-online-accounts')
makedepends=('intltool' 'gobject-introspection')
url="http://www.gnome.org"
options=('!libtool')
conflicts=('libgdata')
replaces=('libgdata')
provides=('libgdata' 'libgdata=0.13.4')

_gitroot=http://git.gnome.org/browse/libgdata
_gitname=libgdata

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  ./autogen.sh --prefix=/usr --disable-static --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
  rm -rf "$srcdir/$_gitname-build"
}
