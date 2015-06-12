# Maintainer: Joni Lapilainen <joni.lapilainen at gmail dot com>

pkgname=0xffff-git
pkgver=0.6.1.r45.g289d2f2
pkgrel=1
pkgdesc="0xFFFF is Open Free Fiasco Firmware Flasher for Maemo devices"
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/pali/0xFFFF"
license=('GPL3')
groups=()
depends=('libusb-compat')
makedepends=('git')
provides=('0xffff')
conflicts=()
replaces=()
backup=()
options=()
install=
source=('0xFFFF::git+https://github.com/pali/0xFFFF.git')
noextract=()
md5sums=('SKIP')

_gitroot=https://github.com/pali/0xFFFF.git
_gitname=0xFFFF

pkgver() {
    cd "$srcdir/$_gitname"
      git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin master
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make all
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
