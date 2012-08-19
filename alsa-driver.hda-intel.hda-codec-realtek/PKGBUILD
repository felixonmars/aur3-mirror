# Maintainer: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=alsa-driver.hda-intel.hda-codec-realtek
pkgver=20120818
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support"
arch=('i686' 'x86_64')
url="http://git.alsa-project.org"
license=('GPL')
makedepends=('wget' 'make' 'tar' 'linux-headers' 'automake>1.6' 'autoconf>2.53')
provides=('alsa-driver.hda-intel.hda-codec-realtek')
conflicts=('alsa-driver.hda-intel.hda-codec-realtek')

_gitroot="git://git.alsa-project.org/alsa-driver.new.git"
_gitname="alsa-driver"
_kupdates=$pkgdir/lib/modules/$(uname -r)/updates

build() {
  msg "Connecting to GIT server...."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build/"
  make ALSAKERNELDIR=../alsa-kernel all-deps
  aclocal
  autoconf
  ./configure
  make dep
  make
  install
}
