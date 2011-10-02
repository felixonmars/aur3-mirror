# Maintainer: trya <tryagainprod@gmail.com>

pkgname=intel-gen4asm-git
pkgver=20111002
pkgrel=1
pkgdesc="A program to compile an assembly language for the Intel 965 Express Chipset"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xorg/app/intel-gen4asm"
license=('MIT')
makedepends=('git')
provides=('intel-gen4asm=1.2')
source=()
md5sums=()

_gitroot="git://anongit.freedesktop.org/xorg/app/intel-gen4asm"
_gitname="intel-gen4asm"

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

  cd "$srcdir"
  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
