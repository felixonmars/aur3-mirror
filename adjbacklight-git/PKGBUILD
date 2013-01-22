# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=adjbacklight-git
pkgver=20130120
pkgrel=1
pkgdesc="Convient method for adjusting the backlight on your portable computer"
arch=('any')
url="https://github.com/maandree/adjbacklight"
license=('GPL3')
depends=('java-runtime>=6')
makedepends=('git' 'java-environment>=6' 'bash')
provides=('adjbacklight')
conflicts=('adjbacklight')

_gitroot=https://github.com/maandree/adjbacklight.git
_gitname=adjbacklight

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
