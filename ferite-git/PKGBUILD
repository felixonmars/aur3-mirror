# Maintainer: Rowan Lewis <rl@nbsp.io>
pkgname=ferite-git
pkgver=20121214
pkgrel=1
pkgdesc="The ferite programming language"
arch=('i686' 'x86_64')
url="http://ferite.org/"
license=('BSD')
depends=('pcre' 'libxml2')
makedepends=('git')

_gitroot=https://github.com/darkrock/ferite
_gitname=ferite

build() {
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin && cd ..
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$_gitname-build"
  git clone "$_gitname" "$_gitname-build"
  cd "$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_gitname-build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et: