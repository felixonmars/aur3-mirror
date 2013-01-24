# Maintainer: Joni Lapilainen <joni.lapilainen at gmail dot com>

_pkgname=0xffff
pkgname=$_pkgname-git
pkgver=20130124
pkgrel=1
pkgdesc="0xFFFF utility implements a free userspace handler for the NOLO bootloader and extended features for flashing, dumping and getting information for the Nokia Internet Tablets."
arch=('armv7h' 'i686' 'x86_64')
url="http://gitorious.org/0xffff/"
license=('GPL3')
depends=('libusb-compat')
makedepends=('git')
provides=('0xffff')
conflicts=('0xffff')

_gitroot="git://gitorious.org/0xffff/0xffff.git"
_gitname=${_pkgname}

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
  make all
}

package() {
  cd "$srcdir/$_gitname-build"
  make install PREFIX="/usr" DESTDIR="$pkgdir"
}
