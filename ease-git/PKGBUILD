# Maintainer: Maël Lavault <moimael@neuf.fr>

pkgname=ease-git
pkgver=20110507
pkgrel=1
pkgdesc="A presentation application for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2>=2.0' 'clutter-gtk2>=0.10' 'clutter>=1.0' 'clutter-gst>=1.0' 'pango' 'libgee>=0.5' 'libxml2' 'gvfs' 'gobject-introspection' 'librest06>=0.6.1')
makedepends=('vala>=0.9.1' 'gcc' 'make' 'git' 'intltool>=0.25' 'json-glib')
options=('!makeflags')
provides=("ease")
url="http://live.gnome.org/Ease"

_gitroot="git://git.gnome.org/ease"
_gitname="ease"

build() {
  cd ${srcdir}
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done"
  msg "Starting make..."
  
  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  
  cd $srcdir/$_gitname-build

  ./autogen.sh --prefix=/usr LIBS="`pkg-config --libs clutter-gst-1.0 --libs libarchive`" || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}



