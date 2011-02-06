# Contributor: Matthew Bauer <mjbauer95@gmail.com>
_pkgname=conduit
pkgname=$_pkgname-git
pkgver=20100926
pkgrel=1
pkgdesc="Data synchronization solution for GNOME"
arch=('i686' 'x86_64')
url="http://www.conduit-project.org/"
license=('GPL')
depends=('python-vobject' 'intltool' 'gnome-doc-utils' 'python-dateutil' 'pygoocanvas' 'dbus-python' 'hicolor-icon-theme')
makedepends=('git')
provides=('conduit' 'conduit-svn')
conflicts=('conduit' 'conduit-svn')
replaces=('conduit-svn')

_gitroot="git://git.gnome.org/$_pkgname"
_gitname="$_pkgname"

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

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
