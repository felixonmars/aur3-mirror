# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pinkie-pie-git
pkgver=20140213
pkgrel=1
pkgdesc="Madame Pinkie Pie: ponified fortune cookies"
arch=('any')
url="https://github.com/maandree/pinkie-pie"
license=('Public Domain')
depends=('fortune-mod' 'ponypipe' 'sh')
makedepends=('git')
provides=('pinkie-pie')
conflicts=('pinkie-pie')

_gitroot=https://github.com/maandree/pinkie-pie.git
_gitname=pinkie-pie

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
  make DESTDIR="$pkgdir/" install
}
