# Maintainer: Anthony Cornehl <accornehl[at]gmail[dot]com>
# https://github.com/twinshadow/abs
pkgname="python2-rdma-git"
pkgdesc="A Python API for the Linux InfiniBand RDMA stack."
pkgver=0.0.0
pkgrel=1
arch=("x86_64" "i686")
url="http://www.obsidianresearch.com/products/software/python-rdma/index.html"
license=('GPL2')
depends=(
    "python2"
    "libibverbs"
)
optdepends=("python2-pyrex")
makedepends=(
    "python2-setuptools"
    "git"
)
source=("$pkgname"::"git+https://github.com/jgunthorpe/python-rdma.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

build () {
  cd "$pkgname"
  python2 setup.py build
}

package () {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
