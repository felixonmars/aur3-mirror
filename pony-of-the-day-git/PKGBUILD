# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pony-of-the-day-git
pkgver=20120702
pkgrel=2
pkgdesc="Server using Quote of the Day protocol and can send my little ponies"
arch=('any')
url="https://github.com/maandree/pony-of-the-day"
license=('Public Domain')
depends=('java-runtime>=7' 'unisay' 'pinkie-pie')
makedepends=('git' 'java-environment>=7')
provides=('pony-of-the-day')
conflicts=('pony-of-the-day')

_gitroot=https://github.com/maandree/pony-of-the-day.git
_gitname=pony-of-the-day

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
