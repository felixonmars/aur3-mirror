# Maintainer: Guten Ye

pkgname="gutenutils-git"
pkgver=20120911
pkgrel=2
pkgdesc="my utils in Linux"
arch=("i686" "x86_64")
url="https://github.com/GutenYe/gutenutils"
license=("MIT")
makedepends=("git")
provides=("gutenutils")
conflicts=("gutenutils")

_gitroot="git://github.com/GutenYe/gutenutils.git"
_gitname="gutenutils"

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
  cd "${srcdir}/${_gitname}-build"

  mkdir -p "$pkgdir/usr/bin"
  cp -r bin/* "$pkgdir/usr/bin"
}
md5sums=()
