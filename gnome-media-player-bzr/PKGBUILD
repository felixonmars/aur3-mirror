# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname=gnome-media-player-bzr
pkgver=122
pkgrel=1
pkgdesc="A simple media player for GNOME that supports VLC, Xine and GStreamer based engines."
url="https://launchpad.net/gnome-media-player"
license="GPL3"
arch=('i686' 'x86_64')
depends=('gconf' 'gstreamer0.10-base-plugins' 'gtkmm>=2.12' 'libunique' 'vlc>=1.0.0' 'xine-lib>=1.1.16')
makedepends=('bzr' 'intltool')
conflicts=('gnome-media-player')

_bzrtrunk=lp:~lamothe-deactivatedaccount/gnome-media-player/2.0-abandoned
_bzrmod=gnome-media-player

build() {
   cd $srcdir

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi

  msg "Connecting to the server...."

  cd ./$_bzrmod

  ./autogen.sh
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
