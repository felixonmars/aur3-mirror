# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=mshadow-git
pkgver=1.1.r217.g5491dfb
pkgrel=1
pkgdesc="Lightweight CPU/GPU Matrix and Tensor Template Library in C++/CUDA for (Deep) Machine Learning"
arch=('any')
url='https://github.com/dmlc/mshadow'
license=('Apache')
makedepends=('git')
optdepends=('cuda')

_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/dmlc/mshadow.git"#branch=master)
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # cutting off 'v' prefix present in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}

  # Install headers
  install -d "${pkgdir}/usr/include/mshadow"
  cp -r "${_dir}/mshadow" "${pkgdir}/usr/include"
}
