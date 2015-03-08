# Maintainer: Augusto Hack <hack.augusto@gmail.com>
pkgname=actool-git
pkgver="0.3.0"
pkgrel=1
pkgdesc="actool, the application container tool"
arch=('x86_64' 'i686')
url="https://github.com/appc"
license=('APACHE')
makedepends=('git' 'go')

_gitroot='https://github.com/appc/spec.git'
_gitname='spec'

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

  ./build
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m755 "bin/actool" "$pkgdir/usr/bin/actool"
}

# vim:set ts=2 sw=2 et:
