# Submitter: Adam Vogt <vogt dot adam et gmail dot com>
# Maintainer: Pavel Sevecek <pavel dot sevecek et gmail dot com>
pkgname=hpfem-hermes-git
pkgver=r5400.e870b11
pkgrel=1
pkgdesc="C++ library for rapid development of adaptive hp-FEM / hp-DG solvers."
arch=('x86_64' 'i686')
url="http://hpfem.org/hermes/"
license=('LGPL')
depends=('gcc-fortran' 'gcc' 'freeglut' 'suitesparse' 'xerces-c' 'xsd' 'anttweakbar' 'trilinos')
makedepends=('git' 'cmake')
provides=('hpfem-hermes')
md5sums=('SKIP')

_gitroot=git://github.com/hpfem/hermes.git
_gitname=hermes

pkgver() {
	cd "$srcdir/$_gitname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}
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
  echo "
  set(H2D_WITH_TEST_EXAMPLES NO)
  set(H2D_WITH_TESTS NO)
  set(WITH_TRILINOS YES)
  set(H2D_WITH_VIEWER_GUI YES)
  set(TARGET_ROOT /usr)" > CMake.vars

  cmake -DCMAKE_INSTALL_PREFIX="/usr"
  make
}
package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
