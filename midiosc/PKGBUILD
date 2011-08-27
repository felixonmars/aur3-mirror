# Maintainer:  Bernardo Barros <bernardobarros@gmail.com>

pkgname=midiosc  
pkgver=20110131
pkgrel=1 
pkgdesc="MidiOSC is a small program to bridge the worlds of MIDI and OSC by providing bidirectional conversion of MIDI to OSC."
url="https://github.com/jstutters/MidiOSC"
arch=('i686' 'x86_64')
license=('GPL')
depends=('liblo')
makedepends=('git')

_gitroot="git://github.com/jstutters/MidiOSC.git"
_gitname="midiosc"

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

  scons
}

package() {

  mkdir -p "$pkgdir/usr/bin"
  install -m 755 $srcdir/$_gitname-build/midiosc  $pkgdir/usr/bin 
} 
