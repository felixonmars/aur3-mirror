# Maintainer: Soo-Hyun Yoo <yoos117@gmail.com>
pkgname=octomap-git
pkgver=20121222
pkgrel=1
pkgdesc="An Efficient Probabilistic 3D Mapping Framework Based on Octrees"
arch=('i686' 'x86_64')
url="http://octomap.github.com/"
license=('New BSD License')
groups=()
depends=()
makedepends=('git')
provides=('octomap')
conflicts=('octomap')

_gitroot=git://github.com/OctoMap/octomap.git
_gitname=octomap

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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build" --depth=1
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  mkdir build &&
  cd build &&
  cmake .. &&
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  cd build &&
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
