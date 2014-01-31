# Maintainer: Igor Babuschkin <ibabuschkin at gmail dot com>

pkgname=python2-numba-git
_gitname=numba
pkgver=2014.01.14.g47a6861
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="https://github.com/numba/numba"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2' 'python2-llvmpy-git' 'python2-meta-git' 'python2-llvmmath-git')
makedepends=('git' 'cython2')
provides=('python2-numba')
conflicts=()
replaces=()
backup=()
source=(git+https://github.com/numba/numba.git)
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    python2 setup.py install --prefix=/usr --root=$pkgdir
}
