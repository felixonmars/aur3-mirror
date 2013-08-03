# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=unisay-git
pkgver=20120715
pkgrel=3
pkgdesc="cowsay+ponysay rewritten in Java, with added features such as pony quotes and full Unicode support"
arch=('any')
url="https://github.com/maandree/unisay"
license=('GPL3')
depends=('java-runtime>=1.5')
makedepends=('git' 'java-environment>=1.5' 'bash' 'make' 'util-say-git' 'sed')
provides=('unisay')
conflicts=('unisay')

_gitroot=https://github.com/maandree/unisay.git
_gitname=unisay

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

  make -B DESTDIR="$pkgdir/"
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
