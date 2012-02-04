# Contributor: <arsenm2@rpi.edu>
pkgname=gir-repository-git
pkgver=20100205
pkgrel=1
pkgdesc="GIR Repository"
arch=(i686 x86_64)
url="http://live.gnome.org/GObjectIntrospection/"
license=('LGPL')
depends=('glib2' 'gobject-introspection-git')

# not really optional if you want to be able to do anything with it,
# but technically not required.

optdepends=('avahi'
            'atk'
            'cairo'
            'clutter'
            'clutter-cairo'
            'clutter-gtk'
            'dbus'
            'dbus-glib'
            'freetype2'
            'gtk2'
            'gtksourceview'
            'gstreamer0.10'
            'gvfs'
            'libsoup'
            'libxft'
            'libxml2'
            'libwebkit'
            'pango'
            'gtk-doc'
            )
makedepends=('git' 'python' 'libtool' 'pkgconfig' 'autoconf' 'gnome-common')
provides=('gir-repository' 'gir-repository-git')
conflicts=('gir-repository' 'gir-repository-svn')
replaces=('gir-repository-svn' 'gir-repository')
backup=()
groups=()
options=(!makeflags docs)
install=
source=()
noextract=()
md5sums=()

_gitroot="git://git.gnome.org/gir-repository"
_gitname="gir-repository"

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
