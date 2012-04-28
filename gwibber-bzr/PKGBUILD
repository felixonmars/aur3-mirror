# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gwibber-bzr
_pkgname=gwibber
pkgver=1341
pkgrel=1
pkgdesc="Microblogging client for GNOME, which supports Twitter, Identi.ca, StatusNet, Facebook, Flickr, Digg, FriendFeed and Qaiku"
arch=('i686' 'x86_64')
url="http://gwibber.com/"
license=('GPL')
depends=('libgee' 'libnotify' 'dee>=1.0.0' 'json-glib' 'gtkspell3' 'python2-gobject' 'libwnck3' 'libwebkit3' 'libgnome-keyring>=3.3' 'dbus-python' 'python2-httplib2' 'python-egenix-mx-base' 'python2-oauth' 'python-imaging' 'pyxdg' 'dconf' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('bzr' 'gnome-common' 'intltool' 'vala>=0.15.0')
provides=('gwibber')
conflicts=('gwibber')
options=('!libtool')
install=$_pkgname.install

_bzrtrunk="lp:gwibber"
_bzrmod="gwibber"

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ] ; then
    cd ${_bzrmod} && bzr pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr branch ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  #
  # BUILD HERE
  #
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
               --disable-static --disable-schemas-compile --disable-unity
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"

  make DESTDIR="$pkgdir" install
}
