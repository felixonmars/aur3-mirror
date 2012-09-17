# Contributor: mariusz myswiat <my.swiat@o2.pl>
# Contributor: Carlos Franke <carlos_franke at lemtank dot de>

pkgname=glib-git
pkgver=20120917
pkgrel=1
pkgdesc="Common C routines used by Gtk+ and other libs"
arch=('i686' 'x86_64')
url="http://gnome.org/"
license=('LGPL')
makedepends=('gcc' 'glibc' 'git' 'gtk-doc')
#options=('!libtool')
provides=('glib2=2.33.1')
conflicts=('glib2')

_gitroot="http://git.gnome.org/browse/glib"
_gitname="glib"

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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd $srcdir/$_gitname-build

  msg "Starting build"
  PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR=$pkgdir install 
}

