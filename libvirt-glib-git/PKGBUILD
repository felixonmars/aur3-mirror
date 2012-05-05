# Maintainer: Stefano Facchini <stefano.facchini@gmail.com>
pkgname=libvirt-glib-git
pkgver=20120505
pkgrel=1
pkgdesc="GLib bindings for libvirt"
arch=(i686 x86_64)
url="http://libvirt.org"
license=('LGPL2.1')
depends=('libvirt' 'glib2' 'gobject-introspection')
makedepends=('git')
provides=(libvirt-glib)
conflicts=(libvirt-glib)
options=('!libtool')

_gitroot=git://libvirt.org/libvirt-glib.git
_gitname=libvirt-glib

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

  PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
