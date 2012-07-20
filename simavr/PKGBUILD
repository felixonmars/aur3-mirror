# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname=simavr
pkgver=1.0b2
pkgrel=1
pkgdesc='A lean, mean and hackable AVR simulator'
arch=('i686' 'x86_64')
url="https://github.com/buserror-uk/simavr"
license=('GPL3')
depends=('avr-gcc' 'elfutils')
makedepends=('git' 'avr-libc')
options=(!strip)

_gitroot="git://github.com/buserror-uk/simavr.git"
_gitname="simavr"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin v$pkgver
    msg "The local files are updated."
  else
    git clone -b v$pkgver $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Arch has AVR includes at a different location
  sed -i 's_/usr/lib/avr_/usr/avr_' Makefile.common

  # simavr still uses deprecated avr-libc symbols
  sed -i '22 a\
      #define __AVR_LIBC_DEPRECATED_ENABLE__' simavr/cores/sim_core_declare.h

  make
}

package() {
  cd "$srcdir/$_gitname-build/$pkgname"

  make DESTDIR="$pkgdir/usr" install
}
