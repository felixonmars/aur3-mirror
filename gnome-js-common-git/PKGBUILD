# Contributor: Matt Arsenault <arsenm2@rpi.edu>
pkgname=gnome-js-common-git
pkgver=20090527
pkgrel=1
pkgdesc="Library and interpreter for JavaScript with GObject type system bindings."
arch=('i686' 'x86_64')
url="http://live.gnome.org/Seed/"
license=('GPL')
depends=('glib2' 'gobject-introspection' 'gir-repository' 'libwebkit' 'readline' 'libsoup')
makedepends=('git' 'cairo' 'autoconf' 'libtool' 'pkgconfig' 'intltool' 'gtk-doc' 'sqlite3' 'gnome-common' 'gtk-doc')
optdepends=('clutter' 'gtk' 'clutter-gtk' 'soup')
provides=('gnome-js-common' 'gnome-js-common-git')
conflicts=('gnome-js-common')
replaces=('gnome-js-common')
backup=()
groups=()
options=(!makeflags docs)
source=()
noextract=()
md5sums=()

_gitroot="git://git.gnome.org/gnome-js-common"
_gitname="gnome-js-common"

build() {
  cd $srcdir
  msg "Connecting to git.gnome.org GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  msg "Starting build"
  ./autogen.sh
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm -rf $srcdir/$_gitname-build
}

