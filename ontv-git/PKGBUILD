# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=ontv-git
pkgver=20110523
pkgrel=1
pkgdesc="GNOME Applet for monitoring TV programs"
arch=('any')
url="http://live.gnome.org/OnTV"
license=('GPL')
depends=('dbus-python' 'python2-gconf' 'python2-libgnome' 'python-notify>=0.1.1' 'vte' 'xmltv' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git' 'gnome-common' 'gnome-python>=2.16.0' 'intltool>=0.33')
provides=('ontv')
conflicts=('ontv')
install=$pkgname.install

_gitroot="git://git.gnome.org/ontv"
_gitname="ontv"

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

  sed -i 's@^#!.*python$@#!/usr/bin/python2@' bin/*

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
               --disable-static --disable-schemas-install --enable-gnome-applet \
               --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
               PYTHON=python2
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
}
