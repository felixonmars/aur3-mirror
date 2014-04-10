# Maintainer: MrSenator <bentwookie8@gmail.com> 
pkgname=pyamg-git
pkgver=20140409
pkgrel=1
pkgdesc="Algebraic Multigrid Solvers in Python"
arch=('i686' 'x86_64')
url="http://www.pyamg.org/"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-nose'
'python2-matplotlib')
makedepends=('python2-distribute' 'git')

_giturl="https://github.com/pyamg/pyamg"

build() {
  git clone ${_giturl}
  cd "${srcdir}/pyamg"
  python2 setup.py build
}

package() {
  cd "${srcdir}/pyamg"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build
}
