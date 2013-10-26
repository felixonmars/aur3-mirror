# Maintainer: Marek Petrik <marekpetrik@gmail.com>
# Adapted from: Augusto F Hack <hack.augusto@gmail.com>
pkgname=python-llvmmath-git
pkgver=1
pkgrel=1
pkgdesc="LLVM math library - The purpose of this project is to provide portable math functions, many of which are in C99 and not available on all platforms. It is based on NumPy's umath and tries to support all floating point and complex types."
arch=('i686' 'x86_64')
url="http://github.com/ContinuumIO/llvmmath.git"
license=('BSD')
depends=('python' 'python-llvmpy-git')
makedepends=('git')

_gitroot=https://github.com/ContinuumIO/llvmmath.git
_gitname=llvmmath.git

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
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
