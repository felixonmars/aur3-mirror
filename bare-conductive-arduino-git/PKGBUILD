# Maintainer: Mathieu Clement <mathieu onedot clement at freebourg onedot org>
pkgname=bare-conductive-arduino-git
pkgver=r4.b582f60
pkgrel=1
pkgdesc="Board definitions for Bare Conductive Arduino-compatible boards"
arch=('i686' 'x86_64')
url="https://github.com/BareConductive/bare-conductive-arduino"
license=('unknown')
depends=(arduino)
source=('bare-conductive-arduino::git+https://github.com/BareConductive/bare-conductive-arduino.git')
makedepends=('git')
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot=https://github.com/BareConductive/bare-conductive-arduino.git
_gitname=bare-conductive-arduino

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
  mkdir -p "$pkgdir/usr/share/arduino/hardware/"
  cp -a Bare_Conductive_Arduino "$pkgdir/usr/share/arduino/hardware/"
}

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
