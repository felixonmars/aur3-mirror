# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=ponypipe-git
pkgver=20130312
pkgrel=1
pkgdesc="Ponify and deponify text"
arch=('any')
url="https://github.com/maandree/ponypipe"
license=('Public Domain')
depends=('java-runtime>=6')
makedepends=('git' 'java-environment>=6' 'bash')
provides=('ponypipe')
conflicts=('ponypipe')

_gitroot=https://github.com/maandree/ponypipe.git
_gitname=ponypipe

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

  make -B
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
