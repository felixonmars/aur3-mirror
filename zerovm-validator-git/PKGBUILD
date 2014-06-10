# Maintainer: <kang@insecure.ws>
pkgname=zerovm-validator-git
pkgver=1.0
pkgrel=1
pkgdesc="ZeroVM is a lightweight virtualization system based on NaCl (Native Client)"
arch=('x86_64')
url="http://www.zerovm.org"
license=('Google')
makedepends=('git')

_gitroot="https://github.com/zerovm/validator.git"
_gitname=zerovm

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

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
