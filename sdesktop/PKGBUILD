# Maintainer: tuxce <tuxce.net@gmail.com>
pkgname=sdesktop
pkgver=20120913
pkgrel=1
pkgdesc="Switch desktop/window with mouse"
arch=(i686 x86_64)
url="http://tuxce.no-ip.org/cgit/public/sdesktop/about/"
license=('GPL')
depends=(libx11)
makedepends=('git')
_gitroot=http://tuxce.no-ip.org/git/public/sdesktop
_gitname=sdesktop

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
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
