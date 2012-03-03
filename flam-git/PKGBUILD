# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=flam
pkgname=$_name-git
pkgver=20120303
pkgrel=1
pkgdesc="A tool for interface designers to build virtual control surfaces for music-related control protocols."
arch=(i686 x86_64)
url="http://vagar.org/code/projects/flam"
license=('GPL')
depends=('qt' 'liblrdf' 'liblo' 'redland' 'dssi')
makedepends=('git' 'cmake')
provides=("$_name")
conflicts=("$_name")
install="$pkgname.install"

_gitroot=http://vagar.org/git/$_name
_gitname=$_name

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

  # DSO link fix (ldl)
  sed -i "/target_link/s/flamwizard[)]*/& dl/" CMakeLists.txt

  mkdir bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build/bld"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
