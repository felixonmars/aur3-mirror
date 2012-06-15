# Maintainer: Jeff <jecxjo at sdf dot lonestar dot org>
pkgname=rpi-update-git
pkgver=20120609
pkgrel=1
pkgdesc="An easier way to update the firmware for your Raspberry Pi"
arch=('arm')
url="http://github.com/Hexxeh/rpi-update"
license=('Public Domain')
groups=()
depends=('ca-certificates')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/Hexxeh/rpi-update.git
_gitname=rpi-update

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
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/bin
  cp rpi-update $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/rpi-update
}
