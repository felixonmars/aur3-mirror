# Maintainer: Cory Giles <mail@corygil.es>

pkgname=bbcp-git
pkgver=20140718
pkgrel=1
pkgdesc="Securely and quickly copy data from source to target."
arch=('x86_64')
url="http://www.slac.stanford.edu/~abh/bbcp/"
license=('LGPL')
makedepends=('git')
provides=('bbcp')
conflicts=('bbcp')
md5sums=()

_gitroot=http://www.slac.stanford.edu/~abh/bbcp/bbcp.git
_gitname=bbcp

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

  cd src
  mkdir -p ../{bin,obj}/amd64_linux
  make makeLinuxx86_64 MD5HEADER=bbcp_MD5_openssl.h OBJMD5="../obj/amd64_linux/bbcp_MD5_openssl.o" OSVER=amd64_linux
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/bin"
  cp bin/amd64_linux/bbcp "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
