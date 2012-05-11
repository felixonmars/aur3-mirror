# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=pulsemix-git
pkgver=20120510
pkgrel=1
pkgdesc="CLI PulseAudio Volume Control"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/pulsemix"
license=('MIT')
depends=('pulseaudio')
makedepends=('git')
conflicts=('pulsemix')
provides=('pulsemix')

_gitroot="git://github.com/falconindy/pulsemix.git"
_gitname="pulsemix"

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  make -C "$_gitname-build" DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
