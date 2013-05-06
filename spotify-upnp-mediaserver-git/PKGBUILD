# Maintainer: Philipp 'TamCore' B. <philipp@tamcore.eu>

pkgname=spotify-upnp-mediaserver-git
pkgver=20130506
pkgrel=1
pkgdesc="spotify-upnp-mediaserver is a daemon that provides a Rygel-compatible media hierarchy from Spotify music streaming service that Rygel exports to the loca network as a UPnP Media Server."
arch=(i386 x86_64)
url="https://gitorious.org/spotifyd/spotify-upnp-mediaserver/blobs/master/README"
license=('GPL3')
depends=('spotifyd')
makedepends=('git' 'vala')
provides=('spotify-upnp-mediaserver')
conflicts=('spotify-upnp-mediaserver')

_gitroot=git://gitorious.org/spotifyd/spotify-upnp-mediaserver.git
_gitname=spotify-upnp-mediaserver

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
}

# vim:set ts=2 sw=2 et:
