# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=acu-git
pkgver=20120722
pkgrel=1
pkgdesc="Utility for configuring Arch Linux at install time"
arch=('x86_64' 'i686')
url="https://github.com/xyproto/acu"
license=('GPL2')
makedepends=('go')
options=('!strip' '!emptydirs')
_gitroot="git://github.com/xyproto/acu.git"
_gitname="acu"

build() {
  cd "$srcdir"

  msg "Connecting to the $_gitname git repository..."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  cd "$srcdir"
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd "$_gitname-build"

  go build -o "$_gitname"
}

package() {
  cd "$_gitname-build"

  install -Dm755 "$_gitname" "$pkgdir/usr/bin/$_gitname"
  install -Dm 644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
