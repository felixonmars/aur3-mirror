# Maintainer: Igor Babuschkin <ibabuschkin at gmail dot com>

pkgname=python-llvmpy-git
pkgver=0.12.7.r5.gc0ae9c2
pkgrel=1
pkgdesc="Python Bindings for LLVM"
url="http://www.llvmpy.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('llvm>=3.4' 'python')
makedepends=(git)
provides=('python-llvmpy')
source=('llvmpy::git+https://github.com/llvmpy/llvmpy.git'
	'https://github.com/llvmpy/llvmpy/pull/97.patch'
	'setup.py.patch')
md5sums=('SKIP'
	'd82d5fe816631d2aebdde221328f27d0'
	'94d198388ef3300fbb24c66e7de03d46')

_gitroot=https://github.com/llvmpy/llvmpy.git
_gitname=llvmpy

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  patch -Np1 -i ../97.patch
  patch -Np1 -i ../setup.py.patch

  python setup.py install \
    --prefix=/usr \
    --root=$pkgdir
}