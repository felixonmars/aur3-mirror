# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Sergey Verhovyh <weerse@gmail.com>
pkgname=goweb-git
pkgver=20110828
pkgrel=1
pkgdesc="web.go is the simplest way to write web applications in the Go programming language"
arch=(i686 x86_64)
url="https://github.com/hoisie/web.go"
license=('MIT')
groups=()
depends=('go>=1:r59')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
source=()
noextract=()
md5sums=()

_gitroot=https://github.com/hoisie/web.go.git
_gitname=web.go

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  if [ $CARCH = x86_64 ]; then
     go_arch=linux_amd64
  elif [ $CARCH = i686 ]; then
     go_arch=linux_386
  else
    msg "Unknown architecture $CARCH"
    return 1
  fi
  make TARGDIR="$pkgdir"/usr/lib/go/pkg/$go_arch  install
}

# vim:set ts=2 sw=2 et:
