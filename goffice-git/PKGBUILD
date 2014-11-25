# Maintainer: qs9rx <that nick at enjoys döt it>
# Previously: moostik <mooostik_at_gmail.com>

pkgname=goffice-git
pkgver=20141124
pkgrel=2
pkgdesc="A library of document-centric objects and utilities built on top of GLib and Gtk+ (Git release)"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL')
options=('!libtool')
conflicts=('goffice')
provides=('goffice')
depends=('gtk3' 'libgsf' 'lasem' 'libspectre' 'libxslt' 'librsvg')
makedepends=('intltool' 'gtk-doc')

_gitroot="git://git.gnome.org/goffice"
_gitname="goffice-git"

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

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --with-lasem
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}" install
}
 
