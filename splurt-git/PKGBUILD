# Maintainer: Ryan Crum <ryan.j.crum@gmail.com>
pkgname=splurt-git
pkgver=20120709
pkgrel=1
pkgdesc="Terminal image viewer"
arch=('any')
url="http://github.com/thorstadt/splurt"
license=('MIT')
groups=()
depends=('libjpeg' 'ncurses')
makedepends=('git')
provides=('splurt')
conflicts=('splurt')
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/thorstadt/splurt.git
_gitname=splurt

build() {
  cd "$srcdir"
  msg "Connecting to github...."

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
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
