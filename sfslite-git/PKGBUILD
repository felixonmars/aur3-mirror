# Maintainer: Jimmy <theotherjimmy[at]gmail[dot]com>
pkgname=sfslite-git
pkgver=20121008
pkgrel=1
pkgdesc="SFSlite C++ development libraries."
url="https://github.com/theotherjimmy/sfslite"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('gmp' 'gcc')
optdepends=()
makedepends=('git')
conflicts=()
replaces=()
backup=()
install='sfslite-git.install'
source=()
md5sums=()

_gitroot=https://github.com/theotherjimmy/sfslite.git
_gitname=sfslite

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

  sh -x setup.gnu -f -i -s
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
