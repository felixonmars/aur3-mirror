# Maintainer: Dan Vratil <dan@progdan.cz>

pkgname=telepathy-glib-git
pkgver=20120730
pkgrel=1
pkgdesc="GLib bindings for the Telepathy D-Bus protocol"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org/"
license=('LGPL2.1')
groups=('telepathy-git')
depends=('dbus-glib')
makedepends=('git' 'python2')
provides=('telepathy-glib')
conflicts=('telepathy-glib')
source=()

_gitroot=git://anongit.freedesktop.org/telepathy/telepathy-glib
_gitname=telepathy-glib

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  export PYTHON=/usr/bin/python2.7
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
