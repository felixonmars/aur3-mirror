# Maintainer: qs9rx < that nick at enjoys dot it>

pkgname=binglide-git
pkgver=de3578ab29
pkgrel=1
pkgdesc="Visual reverse engineering tool showing some of the current techniques."
url="https://github.com/wapiflapi/binglide"
arch=('any')
license=('MIT')
depends=('python-opengl' 'python-llvmpy-git' 'python-numba-git' 'python-pyqtgraph')
makedepends=(git)
source=('git+https://github.com/wapiflapi/binglide.git')
md5sums=('SKIP')

_gitname=binglide

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  python setup.py install \
    --prefix=/usr \
    --root=$pkgdir
}