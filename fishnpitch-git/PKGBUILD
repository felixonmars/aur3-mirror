# Contributor: Robert Schwarz <mail@rschwarz.net>
pkgname=fishnpitch-git
pkgver=20120801
pkgrel=1
pkgdesc="a JACK MIDI real-time tuner"
arch=('i686' 'x86_64')
url="https://github.com/leethargo/fishnpitch"
license=('GPL3')
depends=('jack-audio-connection-kit')
makedepends=('jack-audio-connection-kit')
provides=(fishnpitch)
conflicts=(fishnpitch)
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/leethargo/fishnpitch.git"
_gitname="fishnpitch"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  make || return 1
  mkdir ${pkgdir}/bin
  cp fishnpitch ${pkgdir}/bin
} 
