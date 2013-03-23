# Maintainer: Alastair Stuart <alastair@muto.so>

pkgname=s2png-git
_pkgname=s2png
pkgver=20130323
pkgrel=1
pkgdesc="Something to PNG"
arch=('i686' 'x86_64')
url="https://github.com/dbohdan/s2png"
license=('GPL2')
depends=('gd')
makedepends=('git')
provides=(s2png)

_gitroot="git://github.com/dbohdan/s2png.git"
_gitname=$_pkgname

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  msg "Starting make..."

  make
}

package() {
  cd "$srcdir/$_pkgname-build"

  install -Dm755 "s2png" "${pkgdir}/usr/bin/s2png"
}
