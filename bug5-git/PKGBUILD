# Maintainer: PkmX <pkmx.tw@gmail.com>
pkgname=bug5-git
pkgver=20121019
pkgrel=1
pkgdesc="A Big5/GBK <-> UTF-8 translating layer in terminal"
arch=('i686' 'x86_64')
url="https://github.com/buganini/bug5"
license=('BSD')
depends=('bsdconv')
makedepends=('git')
provides=('bug5')
conflicts=('bug5')

_gitroot=git://github.com/buganini/bug5.git
_gitname=bug5

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

  make PREFIX=/usr
}

package() {
  install -Dm755 "$srcdir/$_gitname-build/bug5" "$pkgdir/usr/bin/bug5"
}

# vim:set ts=2 sw=2 et:
