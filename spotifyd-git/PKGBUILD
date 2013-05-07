# Maintainer: Philipp 'TamCore' B. <philipp@tamcore.eu>

pkgname=spotifyd-git
pkgver=20130506
pkgrel=1
pkgdesc="Spotifyd is a daemon process that provides access to Spotify music streaming service over D-Bus."
arch=(i386 x86_64)
url="https://gitorious.org/spotifyd/spotifyd/blobs/master/README"
license=('GPL3')
depends=('libspotify' 'libgee06' 'python2-dbus')
makedepends=('git' 'vala')
provides=('spotifyd')
conflicts=('spotifyd')

_gitroot=git://gitorious.org/spotifyd/spotifyd.git
_gitname=spotifyd

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

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

  # Sed for Python2
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" tools/*

  install -Dm0755 tools/login "${pkgdir}/usr/bin/spotifyd-login"
  install -Dm0755 tools/logout "${pkgdir}/usr/bin/spotifyd-logout"
  install -Dm0755 tools/configure-session "${pkgdir}/usr/bin/spotifyd-configure-session"
  install -Dm0755 tools/forget-credentials "${pkgdir}/usr/bin/spotifyd-forget-credentials"
}

# vim:set ts=2 sw=2 et:
