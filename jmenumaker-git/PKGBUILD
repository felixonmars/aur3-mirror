# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=jmenumaker-git
pkgver=20120622
pkgrel=3
pkgdesc="A powerful, flexible, clean, simple library for generating menu systems quickly in Java Swing"
arch=('any')
url="https://github.com/maandree/JMenuMaker"
license=('GPL3')
depends=('java-runtime>=6')
makedepends=('git' 'java-environment>=6')
provides=('jmenumaker')
conflicts=('jmenumaker')

_gitroot=https://github.com/maandree/JMenuMaker.git
_gitname=JMenuMaker

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

  make DESTDIR="$pkgdir/"
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
