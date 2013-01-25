# Maintainer: Arno Gaboury <arnaud.gaboury@gmail.com>

pkgname=spice-git
pkgver=20130125
pkgrel=1
pkgdesc="SPICE client"
arch=('x86_64' 'i686')
url="http://spice-space.org"
license=('GPL')
makedepends=(python2-pyparsing git)
depends=(pixman celt0.5.1 spice-protocol alsa-utils libxrandr libxinerama libsasl 
libcacard spice-protocol-git)
conflicts=(spice)
_gitroot="git://anongit.freedesktop.org/spice/spice-gtk"
_gitname="spice"

export PYTHON=python2

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  cd "$srcdir/$_gitname"

  # don't trigger ./configure 
  ./autogen.sh 


  make
}

package() {
  make -C "$_gitname" DESTDIR="$pkgdir" install
}
