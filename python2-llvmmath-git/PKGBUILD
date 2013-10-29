# Maintainer: Augusto F Hack <hack.augusto@gmail.com>
# Contributor: David Verelst
pkgname=python2-llvmmath-git
_gitname=llvmmath
pkgrel=1
pkgver=131.b5d84b2
pkgdesc="LLVM math library - The purpose of this project is to provide portable math functions, many of which are in C99 and not available on all platforms. It is based on NumPy's umath and tries to support all floating point and complex types."
arch=('i686' 'x86_64')
url="http://github.com/ContinuumIO/llvmmath.git"
license=('BSD')
depends=('python2' 'python2-llvmpy-git')
makedepends=('git')
source="git://github.com/ContinuumIO/llvmmath.git"
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
 
package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
