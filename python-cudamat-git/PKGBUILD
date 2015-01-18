# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=python-cudamat-git
pkgver=77+gaf7d9ca
pkgrel=1
pkgdesc="Python module for performing basic dense linear algebra computations on the GPU using CUDA"
arch=('i686' 'x86_64')
url="https://github.com/cudamat/cudamat"
license=('New BSD')
depends=('cuda' 'python-numpy' 'python-nose' 'python-scipy')
makedepends=('git')
source=("git+https://github.com/cudamat/cudamat.git")
md5sums=(SKIP)

pkgver() {
  cd cudamat
  echo $(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)
}

build() {
    cd $srcdir/cudamat
    python setup.py build
    #NVCCFLAGS=-arch=sm_35 python setup.py build
}

package() {
    cd ${srcdir}/cudamat
    python setup.py install --root="${pkgdir}" --optimize=1 || return 1
    #NVCCFLAGS=-arch=sm_35 python setup.py install --root="${pkgdir}" --optimize=1 || return 1
    install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}

