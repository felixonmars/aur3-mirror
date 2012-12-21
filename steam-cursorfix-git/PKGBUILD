
# Maintainer: RunningDroid <rningdrd@tormail.net>

pkgname=steam-cursorfix-git
pkgver=20121220
pkgrel=1
pkgdesc="a script & library that prevents steam from overwriting the X11 Cursor Theme."
arch=('i686' 'x86_64')
url="https://github.com/bldewolf/steam-cursorfix"
license=('unknown')
depends=(steam)
makedepends=('git')
install=install
source=(steam-cursorfix)
sha1sums=('468e480d0345e1eb6df52ab3a11c619b9cddade3')

_gitroot=https://github.com/bldewolf/steam-cursorfix.git
_gitname=steam-cursor-fix

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

  #
  # BUILD HERE
  #
  gcc -shared -o libcursorfix.so cursorfix.c -ldl -fPIC -m32 || exit 1
}

package() {
  cd "$srcdir/$_gitname-build"

  install -d $pkgdir/usr/lib
  install -d $pkgdir/usr/bin

  install libcursorfix.so $pkgdir/usr/lib
  install ../steam-cursorfix $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
