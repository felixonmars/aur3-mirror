# Maintainer: SpepS <dreamspepser at yahoo do it>

_pkg=SeExpr
_pkgbase=seexpr
pkgname=$_pkgbase-git
pkgver=20110901
pkgrel=1
pkgdesc="SeExpr is a simple expression language that provides artistic control and customization for procedural geometry and image synthesis, simulation control, etc."
arch=(i686 x86_64)
url="http://www.disneyanimation.com/technology/seexpr.html"
license=('GPL' 'custom')
depends=('qt')
makedepends=('git' 'cmake' 'doxygen')
provides=("$_pkg")
conflicts=("$_pkg")

_gitroot=https://github.com/wdas/$_pkg.git
_gitname=$_pkgbase

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

  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
  make doc
}

package() {
  cd "$srcdir/$_gitname-build/build"

  # install to proper path
  sed -e "s|home.*optimize|usr|g" \
      -e "s|/lib64/|/lib/|g" \
      -e "s|/demo/|/bin/|g" \
      -i `find . -name cmake_install.cmake`

  make install DESTDIR="$pkgdir/"

  # remove test
  rm -rf "$pkgdir/usr/test"

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  head -n32 ../CMakeLists.txt > \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
